class Public::CommentsController < ApplicationController
  before_action :authenticate_public_customer!, only: [:create, :destroy]
  def create
    @post = Post.find(params[:post_id])
    @comment = current_public_customer.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.score = Language.get_data(comment_params[:comment])
    if @comment.save
      @post.save_notification_comment!(current_public_customer, @comment.id, @post.customer_id)
    end
    # 非同期書き換え
    @comments = @post.comments.order('created_at DESC')
    render :index
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    # 非同期書き換え
    @post = Post.find(params[:post_id])
    @comments = @post.comments.order('created_at DESC')
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
