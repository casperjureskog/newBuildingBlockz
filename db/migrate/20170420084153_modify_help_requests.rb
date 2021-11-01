class ModifyHelpRequests < ActiveRecord::Migration[5.0]
  def change
    remove_column :help_requests, :status
    add_column :help_requests, :urgent, :boolean, default: false
  end
end
