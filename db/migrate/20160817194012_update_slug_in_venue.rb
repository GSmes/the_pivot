class UpdateSlugInVenue < ActiveRecord::Migration[5.0]
  def change
    change_column :venues, :slug, :string
  end
end
