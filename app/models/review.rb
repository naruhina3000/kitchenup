class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :rating, presence: true
  validates :content, length: { minimum: 20 }
  validates :reply, length: { minimum: 20 }, on: :update
end

