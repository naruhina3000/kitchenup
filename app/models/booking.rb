class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :kitchen
  has_one :review

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :confirmation_code, uniqueness: true
  before_validation :generate_confirmation_code

  def generate_confirmation_code
    self.confirmation_code = rand(36**6).to_s(36).upcase
  end

end
