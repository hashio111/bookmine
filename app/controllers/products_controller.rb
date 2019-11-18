class ProductsController < ApplicationController
  require 'net/http'
  def index
  end

  def new
    if params[:key_word].present?
      @user = User.new
      url = 'https://www.googleapis.com/books/v1/volumes?q='
      request = url + "#{params[:key_word]}"
      enc_str = URI.encode(request)
      uri = URI.parse(enc_str)
      json = Net::HTTP.get(uri)
      @books = JSON.parse(json)
    end
  end

  

  def show
    @add_product = Product.new
  end


end
