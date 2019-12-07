class ToppagesController < ApplicationController
  before_action :set_user, only: %i[index]
  def index
    @posts = Post.limit(3).order(created_at: :desc)
    product_ids = Like.group(:product_id).order("count_product_id DESC").limit(3).count(:product_id).keys
    @ranking = product_ids.map { |id| Product.find(id) }
  end
end
