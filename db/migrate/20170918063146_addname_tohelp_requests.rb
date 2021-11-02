class AddnameTohelpRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :help_requests, :name, :string
  end
end
