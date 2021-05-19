class Kitchen < ApplicationRecord
  belongs_to :user
  has_many :kitchen_amenities, dependent: :destroy
  has_many :amenities, through: :kitchen_amenities
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings


  STATUS = ["listed", "snooze", "unlisted"]
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

# @ controller, show kitchen page

#  @ kitchen.incement_view
  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  def increment_view
    self.view = view ? (view + 1) : 1
    save
  end

end
