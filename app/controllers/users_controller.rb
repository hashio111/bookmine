class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(12)
    @q = User.ransack(params[:q])
  end

  def show
    @user = User.find_by(id: params[:id])
    @likes = @user.products.page(params[:page]).per(12)
    @following = @user.following.page(params[:page]).per(12)
    @followers = @user.followers.page(params[:page]).per(12)
  end

  def search
    @q = User.ransack(params[:q])
    @users =
      if params[:q][:name_cont].blank?
        redirect_to users_path
      else
        @q.result(distinct: true).page(params[:page]).per(12)
      end
  end

end
