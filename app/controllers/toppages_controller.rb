class ToppagesController < ApplicationController
  def index
    @user = User.new unless user_signed_in?
    @posts = Post.limit(3).order(created_at: :desc)
  end
end
