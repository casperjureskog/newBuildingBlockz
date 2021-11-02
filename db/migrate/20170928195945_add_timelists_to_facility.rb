class AddTimelistsToFacility < ActiveRecord::Migration[5.0]
  def change
    add_reference :timelists, :facility, foreign_key: true
  end
end
