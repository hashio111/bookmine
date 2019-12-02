class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[edit]
  before_action :set_post, only: %i[edit update destroy]
  before_action :set_product, only: %i[create update]
  before_action :set_user_image, only: %i[index search edit]
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
      render "products/new_post"
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:success] = "口コミを編集しました"
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "口コミを削除しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:dander] = "口コミの削除に失敗しました"
      redirect_back(fallback_location: root_path)
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

  def set_post
    @post = Post.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:post][:product_id])
  end
end
