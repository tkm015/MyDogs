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
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
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
    params.require(:post).permit(:dog_id, :title, :text, :image, :video)
  end
end
