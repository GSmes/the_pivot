require 'rails_helper'

RSpec.feature "User can see all events in a category" do
  scenario "they view page for a specific category and see all events" do
    venue = create(:venue)

    cat1 = Category.create(title: "Kitchen")
    cat1.events.create(
    title: "Knife",
    supporting_act: "Steel with wood handle",
    price: 100,
    image_path: "www",
    venue_id: venue.id,
    date: "2014-09-18 12:30:59 -0700")
    cat1.events.create(title: "Bowl",
    supporting_act: "Steel",
    price: 50,
    image_path: "www",
    venue: venue,
    date: "2014-09-18 12:30:59 -0700")

    cat2 = Category.create(title: "Outdoor Supplies")
    cat2.events.create(
    title: "Shovel",
    supporting_act: "Garden Shovel",
    price: 20.00,
    image_path: "www",
    venue: venue,
    date: "2014-09-18 12:30:59 -0700")
    cat2.events.create(
    title: "Saw",
    supporting_act: "Circular",
    price: 400,
    image_path: "www",
    venue: venue,
    date: "2014-09-18 12:30:59 -0700")

    visit category_path(cat2)

    expect(page).to have_content "Shovel"
    expect(page).to have_content "Saw"

    visit category_path(cat1)

    expect(page).to have_content "Knife"
    expect(page).to have_content "Bowl"

    visit category_path("outdoor-supplies")

    expect(page).to have_content "Outdoor Supplies"
    expect(page).to have_content "Shovel"
    expect(page).to have_content "Saw"
  end
end
