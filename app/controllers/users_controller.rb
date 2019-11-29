class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(12)
  end

  def show
    @user = User.find_by(id: params[:id])
    @likes = @user.products.page(params[:page]).per(12)
    @following = @user.following.page(params[:page]).per(12)
    @followers = @user.followers.page(params[:page]).per(12)
  end
end