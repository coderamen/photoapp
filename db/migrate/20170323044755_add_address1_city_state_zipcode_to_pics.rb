class AddAddress1CityStateZipcodeToPics < ActiveRecord::Migration[5.0]
  def change
    add_column :pics, :address1, :string
    add_column :pics, :city, :string
    add_column :pics, :state, :string
    add_column :pics, :zipcode, :string 
  end
end
