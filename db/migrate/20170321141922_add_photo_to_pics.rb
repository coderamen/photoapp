  class AddPhotoToPics < ActiveRecord::Migration[5.0]
  def change
    add_column :pics, :photo, :json
  end
end
