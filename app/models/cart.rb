class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_event(event_id)
    @contents[event_id.to_s] ||= 0
    @contents[event_id.to_s] += 1
  end

  def total_tickets
    contents.values.sum
  end

  def total_cost
    if contents.empty?
      0.00
    elsif contents.values.max < 2
      Event.find(contents.keys).pluck(:price).sum
    else
      process_sum
    end
  end

  def all_events
    contents.map do |event_id, quantity|
      CartEvent.new(event_id, quantity)
    end
  end

  private

  def process_sum
    all_events.reduce(0) do |initial, event|
      initial += event.sub_total
    end
  end

end
