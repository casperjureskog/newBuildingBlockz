class AddAssociationHelpRequestToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :help_requests, :user, foreign_key: true
  end
end
