class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :dogs, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :introduction, length: { maximum: 100 }
  # ユーザー理論削除
  def active_for_authentication?
    super && (is_active == "有効")
  end
  enum is_active: { "退会": false, "有効": true }

  # いいね機能
  has_many :favorites, dependent: :destroy
  # DM機能
  has_many :messages
  has_many :entries
  has_many :rooms, through: :entries
  # フォロー機能
  has_many :relationships
  # 画像投稿
  mount_uploader :cover_image, CoverImageUploader
  mount_uploader :profile_image, ProfileImageUploader
  # 通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
end
