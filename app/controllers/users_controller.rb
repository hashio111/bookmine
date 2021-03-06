class UsersController < ApplicationController
  before_action :set_user, only: %i[index search]
  def index
    @users = User.page(params[:page])
    @q = User.ransack(params[:q])
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:posts_page]).per(8)
    @likes = @user.products.order(created_at: :desc).page(params[:likes_page]).per(8)
    @following = @user.following.page(params[:following_page]).per(8)
    @followers = @user.followers.page(params[:followers_page]).per(8)
    counts(@user)

    return unless request.xhr?

    case params[:type]
    when "likes_page", "posts_page", "following_page", "followers_page"
      render params[:type].to_s
    end
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
