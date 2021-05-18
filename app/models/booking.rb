class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :kitchen
  has_one :review

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :confirmation_code, uniqueness: true

end
