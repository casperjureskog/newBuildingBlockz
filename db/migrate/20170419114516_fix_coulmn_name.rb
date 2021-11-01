class FixCoulmnName < ActiveRecord::Migration[5.0]
  def change
    rename_table :cfhs, :help_requests
   end
end
