require 'rails_helper'

RSpec.feature "User can view categories list" do
  scenario "from the side navigation bar" do
    Category.create(title: "Kitchen")
    visit root_path

    click_on "Categories"
    click_on "Kitchen"

    expect(current_path).to eq('/categories/kitchen')
  end
end
