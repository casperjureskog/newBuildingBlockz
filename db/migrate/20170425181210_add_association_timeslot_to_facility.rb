class AddAssociationTimeslotToFacility < ActiveRecord::Migration[5.0]
  def change
    add_reference :timeslots, :facility, foreign_key: true
  end
end
