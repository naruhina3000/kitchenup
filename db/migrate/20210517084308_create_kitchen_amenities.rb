class CreateKitchenAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :kitchen_amenities do |t|
      t.references :kitchen, null: false, foreign_key: true
      t.references :amenity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
