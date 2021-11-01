class CreateBookingStats < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_stats do |t|
      t.integer :day
      t.integer :week
      t.string :setting

      t.timestamps
    end
  end
end
