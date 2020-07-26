class Public::PostsController < ApplicationController
  def newimage
    @post = Post.new
  end

  def newvideo
  end

  def index
  end

  def show
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_public_customer_id
    @post.save
    redirect_to public_post_index_path
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    prams.require(:post).permit(:title, :text, :image, :video)
  end
end
