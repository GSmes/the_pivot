class CartEvent < SimpleDelegator
  attr_reader :quantity

  def initialize(event_id, quantity)
    @event = Event.find(event_id.to_i)
    @quantity = quantity
    super(@event)
  end

  def sub_total
    price * quantity
  end
end
