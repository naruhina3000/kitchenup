class Review < ApplicationRecord
   RATING = [ "0", "1", "2", "3", "4", "5"]
  belongs_to :user
  belongs_to :booking

  validates :rating, presence: :true
  validates :rating, numericality: { only_integer: true, greater_than: -1, less_than: 6}
  validates :content, length: { minimum: 20 }
  validates :reply, length: { minimum: 20 }, on: :update
end

