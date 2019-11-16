class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
    # @avatar = User.find_by(id: params[:id])
  end
end