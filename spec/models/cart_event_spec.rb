require 'rails_helper'

RSpec.describe 'Cart Event', type: :model do
  it 'should initialize with an event id and quantity' do
    event = create(:event)
    cart_event = CartEvent.new(event.id, 2)

    expect(cart_event.quantity).to eq(2)
    expect(cart_event.title).to eq(event.title)
  end

  it 'should calculate the sub-total of an event' do
    event = create(:event)
    cart_event = CartEvent.new(event.id, 2)

    expect(cart_event.sub_total).to eq(event.price * cart_event.quantity)
  end
end
