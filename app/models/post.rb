class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :dog
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
end
