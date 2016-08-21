require 'rails_helper'

RSpec.feature "User sees welcome page" do
  scenario "when they visit the root" do
    visit root_path

    expect(page).to have_content("Nosebleed Tickets")
  end
end
