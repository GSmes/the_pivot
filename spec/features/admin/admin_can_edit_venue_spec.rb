require 'rails_helper'

RSpec.feature "Admin can edit a venue" do
  context "registered venue admin" do
    scenario "when they Manage Venue with valid information" do
      venue = create(:venue)
      admin = venue.admin
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_index_path

      expect(page).to have_content(venue.name)

      click_on "Manage Venue"

      expect(current_path).to eq(edit_admin_venue_path(venue))

      fill_in "Name", with: "Cubs Stadium"
      fill_in "City", with: "Compton"
      fill_in "State", with: "CA"
      fill_in "Capacity", with: 100000
      click_on "Update Venue"

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_content("Cubs Stadium Updated Successfully!")
      expect(page).to have_content("Cubs Stadium")

      visit venue_path('cubs-stadium')

      expect(page).to have_content("Cubs Stadium")
      expect(page).to have_content("Compton, CA")
      expect(page).to have_content("100000")
    end

    scenario "when they Manage Venue with invalid information" do
      venues = create_list(:venue, 2)
      admin = venues.first.admin
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_index_path

      click_on "Manage Venue"

      expect(current_path).to eq(edit_admin_venue_path(venues.first))

      fill_in "Name", with: venues.last.name
      click_on "Update Venue"

      expect(page).to have_content("Edit Venue")
      expect(page).to have_content("Name has already been taken")
      expect(page).to_not have_content(Venue.last.name)
    end
  end

  context "multiple existing venues" do
    scenario "venue admin attempts to visit another venue's edit page" do
      venues = create_list(:venue, 2)
      admin = venues.first.admin
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_venue_path(venues.last)

      expect(page).to_not have_content("Edit Venue")
      expect(page).to have_css('img[src*="http://i.imgur.com/F4zRA3g.jpg"]')
    end
  end
end
