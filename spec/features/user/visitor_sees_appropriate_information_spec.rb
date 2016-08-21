require 'rails_helper'

RSpec.feature "Visitor sees appropriate information" do
  scenario "views their cart" do
    event = create(:event)

    visit events_path

    within ("#event-#{event.id}") do
      click_on "Add to Cart"
    end

    visit cart_index_path

    expect(page).not_to have_button("Checkout")
    expect(page).to have_link("Login or Create Account to Checkout")

    click_on "Login or Create Account to Checkout"
    click_on "Create an account"

    fill_in "Username", with: 'Ryan'
    fill_in "Email", with: 'ryan@example.com'
    fill_in "Password", with: 'password'
    click_on "Create Account"

    visit cart_index_path

    within("#event-#{event.id}") do
      expect(page).to have_content(event.title)
      expect(page).to have_content(event.venue.name)
      expect(page).to have_content(event.category.title)
      expect(page).to have_content(event.event_date)
      expect(page).to have_content(event.price)
    end

    expect(page).to have_link("Checkout")

    click_on "Logout"

    expect(page).to have_link("Login")
    expect(page).to_not have_link("Logout")
  end
end
