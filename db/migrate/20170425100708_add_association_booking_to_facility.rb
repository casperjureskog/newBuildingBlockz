class AddAssociationBookingToFacility < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :facility, foreign_key: true
  end
end
