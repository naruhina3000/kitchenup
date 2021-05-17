class CreateKitchens < ActiveRecord::Migration[6.0]
  def change
    create_table :kitchens do |t|
      t.string :title
      t.text :description
      t.integer :size
      t.string :listing_status
      t.text :address
      t.integer :price
      t.string :cancellation_policy
      t.time :opening_time
      t.time :closing_time
      t.integer :views
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
