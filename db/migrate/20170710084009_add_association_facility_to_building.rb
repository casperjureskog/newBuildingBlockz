class AddAssociationFacilityToBuilding < ActiveRecord::Migration[5.0]
  def change
    add_reference :facilities, :building, foreign_key: true
  end
end
