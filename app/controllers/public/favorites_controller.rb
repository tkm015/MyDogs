class Public::FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.create_notification_favorite!(current_public_customer)
    favorite = current_public_customer.favorites.new(post_id: @post.id)
    favorite.save
    # 非同期処理
    render :favorite
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_public_customer.favorites.find_by(post_id: @post.id)
    favorite.destroy
    # 非同期処理
    render :favorite
  end
end
