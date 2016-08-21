class UpdateReferenceInOrderEvents < ActiveRecord::Migration[5.0]
  def change
    remove_reference :order_events, :item
    add_reference :order_events, :event
  end
end
