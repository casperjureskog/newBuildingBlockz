class AddAssociationTimeslotToBuilding < ActiveRecord::Migration[5.0]
  def change
    add_reference :timeslots, :building, foreign_key: true
  end
end
