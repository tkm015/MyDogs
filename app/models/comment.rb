class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :post
  # 通知機能
  has_many :notifications, dependent: :destroy
end
