class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    like = current_user.likes.build(like_params)
    if like.save
      flash[:success] = "お気に入り登録をしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "お気に入り登録に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def like_params
    params.permit(:product_id)
  end
end
