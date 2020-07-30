class Room < ApplicationRecord
  has_many :messages
  has_many :entries
  has_many :customers, through: :entries
end
