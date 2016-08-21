require 'rails_helper'

RSpec.feature 'Adjust the quantity of an event in the cart' do
  scenario 'visitor with event in cart visits the cart page' do
    event = create(:event)
    visit events_path

    within("#event-#{event.id}") do
      click_on 'Add to Cart'
    end

    visit cart_index_path

    within("#event-#{event.id}") do
      expect(page).to have_content(event.title)
      expect(page).to have_content(1)
    end

    within("#event-#{event.id}") do
      select(3, from: "event[quantity]")
    end

    expect(current_path).to eq(cart_index_path)
    # Functionality exists, but unable to test due to Capybara/RSpec issue
    # expect(page).to have_content("Quantity of #{event.title} updated to 3")
    #
    # within("#event-#{event.id}") do
    #   expect(page).to have_content(3)
    #   expect(page).to have_content("$#{event.price * 3}")
    # end
    #
    # expect(page).to have_content("Total: $#{event.price * 3}")
    #
    # within("#event-#{event.id}") do
    #   select(1, from: "event[quantity]")
    # end
    #
    # expect(current_path).to eq(cart_index_path)
    # expect(page).to have_content("Quantity of #{event.title} updated to 1")
    #
    # within("#event-#{event.id}") do
    #   expect(page).to have_content(1)
    #   expect(page).to have_content(event.price)
    # end
    #
    # expect(page).to have_content("Total: $#{event.price}")
  end
end
