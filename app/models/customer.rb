class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :dogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  # いいね機能
  has_many :favorites, dependent: :destroy
  # DM機能
  has_many :messages
  has_many :entries
  has_many :rooms, through: :entries
  # 画像投稿
  mount_uploader :cover_image, CoverImageUploader
  mount_uploader :profile_image, ProfileImageUploader
end
