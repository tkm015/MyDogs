class Dog < ApplicationRecord
  belongs_to :dog_breed
  belongs_to :customer
end
