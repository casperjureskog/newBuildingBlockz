class AddEndTimeToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :end_time, :integer
  end
end
