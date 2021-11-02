class CreateWorkorders < ActiveRecord::Migration[5.0]
  def change
    create_table :workorders do |t|
      t.string :title
      t.string :message
      t.string :location
      t.boolean :urgent
      t.string :status

      t.timestamps
    end
  end
end
