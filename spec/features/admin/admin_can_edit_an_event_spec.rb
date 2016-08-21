require 'rails_helper'

RSpec.feature "Admin can edit an event" do
  context "registered business admin" do
    scenario "when they click Edit on events page" do
      event = create(:event)
      admin = event.venue.admin
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit events_path

      within("#event-#{event.id}") do
        click_on "Edit"
      end

      expect(current_path).to eq(edit_admin_event_path(event))
      fill_in "Title", with: "Hairbrush"
      click_on "Update Event"

      expect(current_path).to eq(event_path(Event.first.venue, Event.first))

      expect(page).to have_content("Hairbrush")
    end
  end

  context "registered customer" do
    scenario "they attempt to visit the edit event path" do
      user = create(:user)
      event = create(:event)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit edit_admin_event_path(event)

      expect(page).to have_css('img[src*="http://i.imgur.com/F4zRA3g.jpg"]')
    end
  end
end
