require 'rails_helper'

RSpec.feature "Admin can login" do
  context "registered business admin" do
    scenario "they visit the login path" do
      create(:venue)

      visit login_path
      fill_in "Username", with: User.first.username
      fill_in "Password", with: "password"
      click_button "Login"

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_link "Logout"
      expect(page).to_not have_link "Login"
    end
  end
end
