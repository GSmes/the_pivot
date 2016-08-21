require 'rails_helper'

RSpec.feature "Event can be sold out" do
  scenario "logged-in user visits the show page of a sold-out event" do
    user = create(:user)
    event = create(:sold_out_event)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit event_path(event.venue, event)

    expect(page).not_to have_button("Add to Cart")
    expect(page).to have_content("SOLD OUT")
  end

  scenario "visitor views the page to view all events" do
    available_event = create(:event)
    sold_out_event = create(:sold_out_event)

    visit events_path

    expect(page).to have_content(available_event.title)
    expect(page).to_not have_content(sold_out_event.title)
  end

  scenario "visitor views the category page for the sold-out event" do
    sold_out_event = create(:sold_out_event)
    category = sold_out_event.category

    visit category_path(category)

    expect(page).not_to have_content(sold_out_event.title)
  end
end
