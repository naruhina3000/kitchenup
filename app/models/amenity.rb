class Amenity < ApplicationRecord
    has_many :kitchen_amenities
    has_many :kitchens, through: :kitchen_amenities
end
