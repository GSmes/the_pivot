require 'rails_helper'

RSpec.describe 'Cart', type: :model do
  it 'should have an empty hash if no session[:cart]' do
    cart = Cart.new(nil)

    expect(cart.contents).to eq({})
  end

  it 'should be able to add event by event id' do
    cart = Cart.new(nil)

    cart.add_event(1)
    cart.add_event(2)
    cart.add_event(2)

    expect(cart.contents).to eq('1' => 1, '2' => 2)
  end

  it 'should be able to calculate total cost' do
    create_list(:event, 2)
    event_1 = Event.first
    event_2 = Event.last
    cart = Cart.new(nil)

    cart.add_event(event_1.id)
    cart.add_event(event_2.id)
    cart.add_event(event_2.id)

    expect(cart.total_cost).to eq(event_1.price + (event_2.price * 2))
  end

  it 'should be able to calculate total events' do
    cart = Cart.new('1' => 3, '4' => 7)

    expect(cart.total_tickets).to eq(10)
  end

  it 'should return 0.00 as total cost for an empty cart' do
    cart = Cart.new(nil)

    expect(cart.total_tickets).to eq(0.00)
  end

  it 'should return 0 as total events for an empty cart' do
    cart = Cart.new(nil)

    expect(cart.total_tickets).to eq(0)
  end

  it 'should return an array of CartEvents for its contents' do
    events = create_list(:event, 2)
    cart = Cart.new(nil)
    cart.add_event(events.first.id)
    cart.add_event(events.last.id)

    expect(cart.all_events.first.quantity).to eq(cart.contents["#{events.first.id}"])
  end
end
