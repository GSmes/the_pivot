require 'rails_helper'

RSpec.feature "User information is secure from others" do
  scenario "guest attempts to visit a user's show page" do
    place_order

    visit order_path(Order.first)

    expect(page).to have_content("Please login to view this page")
    expect(current_path).to eq(login_path)

    visit dashboard_path

    expect(page).to have_content("Please login to view this page")
    expect(current_path).to eq(login_path)

    visit orders_path

    expect(page).to have_content("Please login to view this page")
    expect(current_path).to eq(login_path)

    visit admin_dashboard_index_path
    expect(page).to have_css('img[src*="http://i.imgur.com/F4zRA3g.jpg"]')

    visit events_path
    click_on "Add to Cart"

    visit cart_index_path

    expect(page).to have_link("Login or Create Account to Checkout")

    visit edit_user_path(User.first)
    expect(page).to have_content("Please login to view this page")
  end

  scenario "logged-in user attempts to visit another user's show page" do
    place_order

    user1 = create(:user)
    user2 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit order_path(Order.first)

    expect(page).to have_content("You do not have the proper permissions to view that page")
    expect(current_path).to eq(dashboard_path)

    visit admin_dashboard_index_path
    expect(page).to have_css('img[src*="http://i.imgur.com/F4zRA3g.jpg"]')

    visit edit_user_path(user2)
    expect(page).to have_content("You can only edit your own account")
    expect(current_path).to eq(edit_user_path(user1))
  end
end

private

def place_order
  user = create(:user)
  create(:event)

  visit login_path
  within('form') do
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'
    click_on 'Login'
  end

  visit events_path
  click_on "Add to Cart"
  click_on "Add to Cart"

  visit cart_index_path
  click_on "Checkout"

  click_on 'Logout'
end
