class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page]).per(12)
  end

  def show
    @user = User.find_by(id: params[:id])
    @likes = @user.products

  end
end
