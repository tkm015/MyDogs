class Dog < ApplicationRecord
  belongs_to :dog_breed
  belongs_to :customer
  has_many :posts, dependent: :destroy
  mount_uploader :cover_image, CoverImageUploader
  mount_uploader :profile_image, ProfileImageUploader
  enum sex: { "雌": false, "雄": true }
end
