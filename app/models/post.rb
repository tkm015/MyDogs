class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :dog
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # 画像・動画機能
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  # 通知機能
  has_many :notifications, dependent: :destroy

  # タグ機能
  acts_as_taggable

  with_options presence: true do
    validates :video_or_image
    validates :title
    validates :text
  end

  def video_or_image
    video.presence or image.presence
  end

  # favoriteにログインcustomerが含まれているか判定
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  # いいね通知
  def create_notification_favorite!(current_customer)
    # すでに「いいね」されているか
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_customer.id, customer_id, id, 'favorite'])
    # いいねされていない場合、通知レコードを作成
    if temp.blank?
      notification = current_customer.active_notifications.new(
        post_id: id,
        visited_id: customer_id,
        action: 'favorite'
      )
      # 自分の投稿に対する言い値の場合　通知済みに
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  # コメント通知
  def save_notification_comment!(current_customer, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_customer.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )

    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
     end
end
