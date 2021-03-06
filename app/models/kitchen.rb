class Kitchen < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :kitchen_amenities, dependent: :destroy
  has_many :amenities, through: :kitchen_amenities
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  geocoded_by :address

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

  after_validation :geocode, if: :will_save_change_to_address?

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

  def average_rating
    ratings = self.reviews.pluck(:rating)
    if ratings.count > 0
      ratings.sum / ratings.count
    else
      0
    end
  end

end
