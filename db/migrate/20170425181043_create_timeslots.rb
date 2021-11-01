class CreateTimeslots < ActiveRecord::Migration[5.0]
  def change
    create_table :timeslots do |t|
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
