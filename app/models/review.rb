class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :rating, presence: true
  validates :content, presence: true
  validates :reply, presence: true

end
