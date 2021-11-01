class CreateTimelists < ActiveRecord::Migration[5.0]
  def change
    create_table :timelists do |t|
      t.time :time

      t.timestamps
    end
  end
end
