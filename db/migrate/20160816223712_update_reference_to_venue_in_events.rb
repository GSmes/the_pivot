class UpdateReferenceToVenueInEvents < ActiveRecord::Migration[5.0]
  def change
    remove_reference :events, :celebrity
    add_reference :events, :venue
  end
end
