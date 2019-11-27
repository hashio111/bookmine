class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find_by(id: params[:id])
    @products = @user.products
  end
end
