require 'rails_helper'

RSpec.feature "Visitor Views All Events", type: :feature do
  scenario "on the events index page" do
    event1 = create(:event)
    event2 = create(:event)

    visit events_path

    within('#events_list') do
      expect(page).to have_content(event1.venue.name)
      expect(page).to have_content(event2.venue.name)
      expect(page).to have_content(event2.price)
      expect(page).to have_content(event2.price)
    end
  end
end
