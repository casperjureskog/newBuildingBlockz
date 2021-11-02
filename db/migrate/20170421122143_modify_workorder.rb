class ModifyWorkorder < ActiveRecord::Migration[5.0]
  def change
    change_column :workorders, :urgent, :boolean, default: false
    change_column :workorders, :status, :string, default: 'pending'
  end
end
