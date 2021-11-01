class CreateFacilities < ActiveRecord::Migration[5.0]
  def change
    create_table :facilities do |t|
      t.string :name
      t.text :description
      t.text :rules
      t.boolean :status

      t.timestamps
    end
  end
end
