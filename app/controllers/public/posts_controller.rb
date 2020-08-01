class Public::PostsController < ApplicationController
  def newimage
    @post = Post.new
    @dogs = current_public_customer.dogs
  end

  def newvideo
    @post = Post.new
    @dogs = current_public_customer.dogs
  end

  def index
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}")
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_public_customer.id
    @post.save
    redirect_to public_posts_path
  end

  def update
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to public_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:dog_id, :title, :text, :image, :video, :tag_list)
  end
end
