class AddCapacityToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :capacity, :integer
  end
end
