class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :kitchen

  validates :kitchen, uniqueness: { scope: :user }
end
