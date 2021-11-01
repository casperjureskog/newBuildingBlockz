class AddAssociationNewsToBuilding < ActiveRecord::Migration[5.0]
  def change
    add_reference :news, :building, foreign_key: true
  end
end
