class ToppagesController < ApplicationController
  def index
    @user = User.new unless user_signed_in?

  end
end