class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :dog
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
end
