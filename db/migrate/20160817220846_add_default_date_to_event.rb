class AddDefaultDateToEvent < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :date, :datetime, :default => "2014-09-18 12:30:59 -0700"
  end
end
