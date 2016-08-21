class AddSlugToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :slug, :text
  end
end
