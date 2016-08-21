require 'rails_helper'

RSpec.feature "User can edit account" do
  scenario "user edits account from dashboard" do
    user = create(:user)

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: 'password'

    click_button "Login"
    click_on "Manage Account"

    fill_in "Username", with: "Matt"
    fill_in "Email", with: "matt@example.com"
    fill_in "Password", with: "password1"

    click_on "Update Account"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Matt")
    expect(page).to have_content("matt@example.com")
    expect(page).to have_no_content(user.username)
  end

  scenario "user cannot change another user's account" do
    user1 = create(:user)
    user2 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit edit_user_path(user2)

    expect(page).to have_no_content(user2.username)
    expect(current_path).to eq(edit_user_path(user1))
    expect(page).to have_content("You can only edit your own account")
  end
end
