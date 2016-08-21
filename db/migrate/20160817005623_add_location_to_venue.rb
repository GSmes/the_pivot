class AddLocationToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :city, :text
    add_column :venues, :state, :text
  end
end
