class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name self_introduction image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name self_introduction image])
  end

  def after_sign_in_path_for(_resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  private

  def set_user
    @user = User.new unless user_signed_in?
  end

  def counts(user)
    @count_posts = user.posts.count
    @count_likes = user.products.count
    @count_following = user.following.count
    @count_followers = user.followers.count
  end
end
