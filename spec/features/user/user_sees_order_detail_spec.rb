require 'rails_helper'

RSpec.feature "User sees one order's detail" do
  scenario "logged-in user creates an order and visits their order show page" do
    user = create(:user)
    event = create(:event)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit events_path
    click_on "Add to Cart"
    click_on "Add to Cart"

    visit cart_index_path
    click_on "Checkout"

    order = Order.first

    expect(current_path).to eq(orders_path)

    click_on "Order Details"

    expect(current_path).to eq(order_path(order))
    expect(page).to have_content(order.status)

    within("#event-#{event.id}") do
      expect(page).to have_content(event.title)
      expect(page).to have_content(event.supporting_act)
      expect(page).to have_content(order.event_quantity(event))
      expect(page).to have_content(event.price)
      expect(page).to have_content(order.sub_total(event))
      expect(page).to have_content(order.time_updated)
    end
    expect(page).to have_content(order.total)
  end
end
