class Kitchen < ApplicationRecord
  belongs_to :user
  has_many :kitchen_amenities
  has_many :amenities, through: :kitchen_amenities
  has_many :bookings
  has_many :reviews, through: :bookings


  STATUS = ["listed", "snooze", "unlisted", "deactivate"]
  POLICY = ["flexible", "moderate", "strict"]

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :size, presence: true
  validates :listing_status, inclusion: { in: STATUS }
  validates :address, presence: true
  validates :price, presence: true
  validates :cancellation_policy, inclusion: { in: POLICY }
  validates :opening_time, presence: true
  validates :closing_time, presence: true
end
