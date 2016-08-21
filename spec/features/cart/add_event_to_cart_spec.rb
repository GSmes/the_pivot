require 'rails_helper'

RSpec.feature 'Add event to cart' do
  context 'registered user' do
    scenario 'they view the venue index' do
      user = create(:user)
      events = create_list(:event, 2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit venues_path

      within("#venue-#{events.first.venue.id}") do
        click_on "View Venue"
      end

      expect(page).to have_content(events.first.venue.name)
      expect(page).to have_content(events.first.venue.location)
      expect(page).to have_content(events.first.venue.capacity)

      expect(page).to have_content(events.first.title)
      expect(page).to have_content(events.first.category.title)
      expect(page).to have_content(events.first.price)
      expect(page).to have_content(events.first.event_date)

      within("#event-#{events.first.id}") do
        click_on "Add to Cart"
      end

      expect(current_path).to eq(venue_path(events.first.venue))

      visit venues_path
      within("#venue-#{events.last.venue.id}") do
        click_on "View Venue"
      end

      within("#event-#{events.last.id}") do
        click_on "Add to Cart"
      end

      visit cart_index_path

      expect(page).to have_content(events.first.title)
      expect(page).to have_content(events.first.category.title)
      expect(page).to have_content(events.first.venue.name)
      expect(page).to have_content(events.first.event_date)
      expect(page).to have_content(events.first.price)
      expect(page).to have_content(events.last.title)
      expect(page).to have_content(events.last.category.title)
      expect(page).to have_content(events.last.venue.name)
      expect(page).to have_content(events.last.event_date)
      expect(page).to have_content(events.last.price)
    end
  end

  context 'guest' do
    scenario 'they view the venue index' do
      events = create_list(:event, 2)

      visit venues_path

      within("#venue-#{events.first.venue.id}") do
        click_on "View Venue"
      end

      expect(page).to have_content(events.first.venue.name)
      expect(page).to have_content(events.first.venue.location)
      expect(page).to have_content(events.first.venue.capacity)

      expect(page).to have_content(events.first.title)
      expect(page).to have_content(events.first.category.title)
      expect(page).to have_content(events.first.price)
      expect(page).to have_content(events.first.event_date)

      within("#event-#{events.first.id}") do
        click_on "Add to Cart"
      end

      expect(current_path).to eq(venue_path(events.first.venue))

      visit venues_path
      within("#venue-#{events.last.venue.id}") do
        click_on "View Venue"
      end

      within("#event-#{events.last.id}") do
        click_on "Add to Cart"
      end

      visit cart_index_path

      expect(page).to have_content(events.first.title)
      expect(page).to have_content(events.first.category.title)
      expect(page).to have_content(events.first.venue.name)
      expect(page).to have_content(events.first.event_date)
      expect(page).to have_content(events.first.price)
      expect(page).to have_content(events.last.title)
      expect(page).to have_content(events.last.category.title)
      expect(page).to have_content(events.last.venue.name)
      expect(page).to have_content(events.last.event_date)
      expect(page).to have_content(events.last.price)
    end
  end
end
