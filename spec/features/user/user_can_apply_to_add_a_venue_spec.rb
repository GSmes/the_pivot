require 'rails_helper'

RSpec.feature "User can apply to add a venue" do
  context "guest user" do
    scenario "visit the root path" do

      visit root_path

      click_on "Sell With Us"

      expect(current_path).to eq(login_path)
    end
  end

  context "registered user" do
    scenario "visit the root path" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).
        to receive(:current_user).
        and_return(user)

      visit root_path

      click_on "Sell With Us"

      expect(current_path).to eq(new_venue_path)
      expect(page).to_not have_content("Status")

      fill_in "City", with: "Chicago"
      fill_in "State", with: "IL"
      fill_in "Capacity", with: 50000
      fill_in "Venue Name", with: "Turing Stadium"
      fill_in "Image URL", with: "http://i.imgur.com/lVgLlvg.jpg"

      click_button "Submit Application"

      expect(page).to have_content "Application submitted! You will hear from us within 3-5 business days."
      expect(Venue.last.status).to eq "offline"
      expect(current_path).to eq(dashboard_path)
    end

    scenario "visit the dashboard" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).
        to receive(:current_user).
        and_return(user)

      visit dashboard_path

      click_on "Sell With Us"

      expect(current_path).to eq(new_venue_path)
    end

    scenario "fill in form with invalid information" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).
        to receive(:current_user).
        and_return(user)

      visit new_venue_path

      fill_in "Capacity", with: 50000
      fill_in "Venue Name", with: "Turing Stadium"
      fill_in "Image URL", with: "http://i.imgur.com/lVgLlvg.jpg"

      click_button "Submit Application"

      expect(page).to have_content "Venue Application"
      expect(page).to have_content "City can't be blank, State can't be blank"
    end
  end

  context "logged in venue admin" do
    scenario "visit the dashboard path" do
      admin = create(:venue).admin
      allow_any_instance_of(ApplicationController).
        to receive(:current_user).
        and_return(admin)

      visit dashboard_path

      expect(page).to_not have_link "Sell With Us"
    end
  end

  context "logged in platform admin" do
    scenario "visit the dashboard path" do
      admin = create(:platform_admin)
      allow_any_instance_of(ApplicationController).
        to receive(:current_user).
        and_return(admin)

      visit dashboard_path

      expect(page).to_not have_link "Sell With Us"
    end
  end
end
