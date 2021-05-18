class ChangeOpeningHourFormatsToKitchens < ActiveRecord::Migration[6.0]
  def change
    remove_column :kitchens, :opening_time
    remove_column :kitchens, :closing_time
    add_column :kitchens, :opening_time, :integer
    add_column :kitchens, :closing_time, :integer
  end
end
