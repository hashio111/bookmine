class UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
    @q = User.ransack(params[:q])
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page])
    @likes = @user.products.order(created_at: :desc).page(params[:page])
    @following = @user.following.page(params[:page])
    @followers = @user.followers.page(params[:page])
  end

  def search
    @q = User.ransack(params[:q])
    @key_word = params[:q][:name_cont]
    @users =
      if @key_word.blank?
        redirect_to users_path
      else
        @q.result(distinct: true).page(params[:page])
      end
  end
end
