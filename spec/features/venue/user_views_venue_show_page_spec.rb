require 'rails_helper'

RSpec.feature 'User views a venue show page' do
  scenario 'A guest user visits the venues index' do
    venues = create_list(:venue, 2)
    visit venues_path

    within("#venue-#{venues.first.id}") do
      click_on "View Venue"
    end

    expect(current_path).to eq(venue_path(venues.first))
    expect(page).to have_content(venues.first.name)
    expect(page).to have_content(venues.first.city)
    expect(page).to have_content(venues.first.state)
    expect(page).to have_content(venues.first.capacity)
    expect(page).not_to have_content(venues.last.name)
  end
end
