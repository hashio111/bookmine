class ToppagesController < ApplicationController
  require 'net/http'
  def index
    url = 'https://www.googleapis.com/books/v1/volumes?q='
    request = url + "rails"
    enc_str = URI.encode(request)
    uri = URI.parse(enc_str)
    json = Net::HTTP.get(uri)
    @books = JSON.parse(json)
  end
end