require 'rails_helper'

RSpec.feature "User sees event show page" do
  scenario "when they visit path for specific event" do
    event = create(:event)
    description = "See the sights and hear the sounds at \
      #{event.title}, featuring #{event.supporting_act}. \
      Sure to be an unforgettable evening!"
    marketing = "Get your tickets for some truly believable seats now!"

    visit event_path(event.venue, event)

    expect(page).to have_css("img[src*=\"#{event.venue.image_path}\"]")
    expect(page).to have_content(event.title)
    expect(page).to have_content(event.venue_name)
    expect(page).to have_content(event.supporting_act)
    expect(page).to have_content(description)
    expect(page).to have_content(marketing)
    expect(page).to have_content(event.price)
    expect(page).to have_button("Add to Cart")
  end
end
