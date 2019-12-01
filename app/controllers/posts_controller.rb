class PostsController < ApplicationController
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      flash[:success] = "口コミを投稿しました"
      redirect_to product_path(post.product_id)
    else
      @post = post
      @product = Product.find(params[:post][:product_id])
      render 'products/new_post'
    end
  end

  def search
    @q = Post.ransack(params[:q])
    @key_word = params[:q][:title_or_content_or_product_title_cont]
    @posts =
      if @key_word.blank?
        redirect_to users_path
      else
        @q.result(distinct: true).order(created_at: :desc).page(params[:page])
      end
  end


  private

  def post_params
    params.require(:post).permit(:title, :rate, :content, :product_id)
  end
end
