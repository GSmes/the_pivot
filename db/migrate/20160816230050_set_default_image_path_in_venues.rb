class SetDefaultImagePathInVenues < ActiveRecord::Migration[5.0]
  def change
    change_column :venues, :image_path, :text, :default => 'http://i.imgur.com/5p6sEsX.jpg'
  end
end
