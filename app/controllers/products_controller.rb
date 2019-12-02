class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[new_post]
  before_action :set_user, only: %i[new show]
  before_action :set_user_image, only: %i[new show new_post]
  require 'net/http'
  def index; end

  def new
    if params[:key_word].present?
      url = 'https://www.googleapis.com/books/v1/volumes?q='
      request = url + params[:key_word].to_s
      enc_str = URI.encode(request)
      uri = URI.parse(enc_str)
      json = Net::HTTP.get(uri)
      @products = JSON.parse(json)
    end
  end

  def product_registration
    product = Product.where(title: params[:title]).first_or_initialize
    product.image_url = params[:image_url]
    product.author = params[:author].join("/") unless params[:author].nil?
    product.description = params[:description]
    product.publisher = params[:publisher]
    product.release_date = params[:release_date]
    redirect_to product_path(product) if product.save
  end

  def new_post
    @product = Product.find_by(id: params[:id])
    @post = Post.new
  end

  def show
    @product = Product.find_by(id: params[:id])
    @posts = @product.posts
  end
end
