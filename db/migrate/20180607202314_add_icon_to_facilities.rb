class AddIconToFacilities < ActiveRecord::Migration[5.0]
  def change
    add_column :facilities, :icon, :string
  end
end
