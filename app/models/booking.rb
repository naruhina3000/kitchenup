class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :kitchen
  has_one :review

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :confirmation_code, uniqueness: true

  validate :end_date_after_start_date

  before_validation :generate_confirmation_code

  def generate_confirmation_code
    self.confirmation_code = rand(36**6).to_s(36).upcase
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end
end
