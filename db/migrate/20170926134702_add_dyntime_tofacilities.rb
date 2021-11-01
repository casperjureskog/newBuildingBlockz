class AddDyntimeTofacilities < ActiveRecord::Migration[5.0]
  def change
    add_column :facilities, :dyntime, :string
    add_column :facilities, :bok_day, :string
    add_column :facilities, :bok_dur, :string
  end
end
