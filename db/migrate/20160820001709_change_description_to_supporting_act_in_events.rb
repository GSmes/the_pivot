class ChangeDescriptionToSupportingActInEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :description
    add_column :events, :supporting_act, :text
  end
end
