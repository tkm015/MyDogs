class Public::FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.create_notification_favorite!(current_public_customer)
    favorite = current_public_customer.favorites.new(post_id: post.id)
    favorite.save
    redirect_back(fallback_location: public_root_path)
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_public_customer.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_back(fallback_location: public_root_path)
  end
end
