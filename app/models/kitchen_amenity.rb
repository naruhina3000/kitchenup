class KitchenAmenity < ApplicationRecord
  belongs_to :kitchen
  belongs_to :amenity

  validates :kitchen, uniqueness: { scope: :amenity }
end
