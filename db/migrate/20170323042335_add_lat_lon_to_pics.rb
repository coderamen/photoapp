class AddLatLonToPics < ActiveRecord::Migration[5.0]
  def change
    add_column :pics, :latitude, :float
    add_column :pics, :longitude, :float
  end
end
