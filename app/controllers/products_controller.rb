class ProductsController < ApplicationController
  require 'net/http'
  def index; end

  def new
    if params[:key_word].present?
      @user = User.new
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
  end

  def show
    @product = Product.find_by(id: params[:id])
  end
end
