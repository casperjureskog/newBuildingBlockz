class AddAssociationsWorkorderToHelpRequest < ActiveRecord::Migration[5.0]
  def change
    add_reference :workorders, :help_request, foreign_key: true
    add_reference :help_requests, :workorder, foreign_key: true
  end
end
