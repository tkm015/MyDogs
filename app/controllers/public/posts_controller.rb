class Public::PostsController < ApplicationController
  before_action :set_dogs, onlr: [ :newimage, :newvideo, :create]
  def newimage
    @post = Post.new
  end

  def newvideo
    @post = Post.new
  end

  def index
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}")
    elsif params[:image]
      @image = params[:image]
      @posts = Post.where(video: nil)
    elsif params[:video]
      @video = params[:video]
      @posts = Post.where(image: nil)
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
    if @post.save
      redirect_to public_posts_path
    else
      render 'newimage'
    end
  end

  def update
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to public_posts_path
  end

  private
  def set_dogs
    @dogs = current_public_customer.dogs
  end

  def post_params
    params.require(:post).permit(:dog_id, :title, :text, :image, :video, :tag_list)
  end
end
