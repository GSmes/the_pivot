class RenameItemsToEvents < ActiveRecord::Migration[5.0]
  def change
    rename_table :items, :events
  end
end
