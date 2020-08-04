class Dog < ApplicationRecord
  belongs_to :dog_breed
  belongs_to :customer
  has_many :posts, dependent: :destroy
  has_many :relationships

  with_options presence: true do
  validates :cover_image
  validates :profile_image
  validates :name
  validates :date_of_birth
  validates :sex
  validates :introduction
  end
  # 画像投稿機能
  mount_uploader :cover_image, CoverImageUploader
  mount_uploader :profile_image, ProfileImageUploader
  enum sex: { "男の子": false, "女の子": true }
end
