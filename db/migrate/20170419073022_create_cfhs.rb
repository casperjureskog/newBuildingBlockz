class CreateCfhs < ActiveRecord::Migration[5.0]
  def change
    create_table :cfhs do |t|
      t.string :title
      t.string :message
      t.boolean :status

      t.timestamps
    end
  end
end
