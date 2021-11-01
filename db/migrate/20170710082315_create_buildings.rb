class CreateBuildings < ActiveRecord::Migration[5.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :street
      t.integer :zip_code
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
