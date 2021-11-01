class AddAssociationWorkorderToBuilding < ActiveRecord::Migration[5.0]
  def change
    add_reference :workorders, :building, foreign_key: true
  end
end
