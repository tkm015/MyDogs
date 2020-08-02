class Public::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_public_customer.comments.new(comment_params)
    @post = comment.post
    comment.post_id = post.id
    comment.save
    @post.create_notification_comment!(current_public_customer, comment_id)
    redirect_to public_post_path(post)
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_back(fallback_location: public_root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
