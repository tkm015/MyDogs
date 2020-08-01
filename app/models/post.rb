class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :dog
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  # タグ機能
  acts_as_taggable

  # favoriteにログインcustomerが含まれているか判定
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
