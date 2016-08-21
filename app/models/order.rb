class Order < ApplicationRecord
  belongs_to :user
  has_many :order_events
  has_many :events, through: :order_events
  enum status: %w(Ordered Paid Cancelled Completed)

  def date
    created_at.strftime("%m/%d/%Y")
  end

  def sub_total(event)
    event_quantity(event) * event.price
  end

  def total
    events.reduce(0) { |initial, event| initial += sub_total(event) }
  end

  def time_updated
    updated_at.strftime("%m-%e-%y %H:%M %p")
  end

  def event_quantity(event)
    OrderEvent.find_by(order: self, event: event).quantity
  end

  def total_events
    events.uniq.count
  end

  def total_tickets
    events.reduce(0) { |initial, event| initial += event_quantity(event) }
  end

  def total_in_cents
    total.to_f * 100
  end

  def ordered?
    status == "Ordered"
  end
end
