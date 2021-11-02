class AddBookingStatsToFacility < ActiveRecord::Migration[5.0]
  def change
    add_reference :booking_stats, :facility, foreign_key: true
  end
end
