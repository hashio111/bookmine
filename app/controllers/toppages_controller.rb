class ToppagesController < ApplicationController
  def index
    @user = User.new unless user_signed_in?
    @posts = Post.limit(3).order(created_at: :desc)
    product_ids = Like.group(:product_id).order("count_product_id DESC").limit(3).count(:product_id).keys
    @ranking = product_ids.map{|id| Product.find(id)}
  end
end