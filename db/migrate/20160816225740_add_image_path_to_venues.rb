class AddImagePathToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :image_path, :text
  end
end
