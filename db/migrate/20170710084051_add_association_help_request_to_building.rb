class AddAssociationHelpRequestToBuilding < ActiveRecord::Migration[5.0]
  def change
    add_reference :help_requests, :building, foreign_key: true
  end
end
