require 'rails_helper'

RSpec.feature "User can view past orders" do
  scenario "when they go to their Order History page" do
    user = create(:user)
    create(:event)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit events_path
    click_on "Add to Cart"
    click_on "Add to Cart"

    visit cart_index_path
    click_on "Checkout"

    order = Order.first

    within("#order-#{order.id}") do
      expect(page).to have_content(order.date)
      expect(page).to have_content(order.total_tickets)
      expect(page).to have_content(order.total)
    end
  end
end
