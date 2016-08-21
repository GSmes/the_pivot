class RenameCelebrityToVenue < ActiveRecord::Migration[5.0]
  def change
    rename_table :celebrities, :venues
  end
end
