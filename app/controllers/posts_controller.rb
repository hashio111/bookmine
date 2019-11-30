class PostsController < ApplicationController
  def index
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      flash[:success] = "口コミを投稿しました"
      redirect_to product_path(post.product_id)
    else
      flash.now[:danger] = "口コミの投稿に失敗しました"
      render "products/new_post"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :rate, :content, :product_id)
  end


end
