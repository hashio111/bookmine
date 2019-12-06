class RankingsController < ApplicationController
  before_action :set_user, only: %i[index]
  def index
    likes_product_ids = Like.group(:product_id).order("count_product_id DESC").count(:product_id).keys
    likes_arr = likes_product_ids.map { |id| Product.find(id) }
    @likes_ranking = Kaminari.paginate_array(likes_arr).page(params[:likes_ranking_page]).per(6)
    posts_product_ids = Post.group(:product_id).order("count_product_id DESC").count(:product_id).keys
    posts_arr = posts_product_ids.map { |id| Product.find(id) }
    @posts_ranking = Kaminari.paginate_array(posts_arr).page(params[:page]).per(2)
    return unless request.xhr?
    case params[:type]
    when "likes_ranking_page"
      render "#{params[:type]}"
    end
  end
end