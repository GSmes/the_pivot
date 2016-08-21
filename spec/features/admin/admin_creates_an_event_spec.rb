require 'rails_helper'

RSpec.feature 'Admin creates an event' do
  context 'with valid event infomation and no photo' do
    scenario 'logged-in admin visits the events path' do
      admin = create(:admin)
      categories = create_list(:category, 3)
      venue = create(:venue)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit events_path
      click_on 'Add New Event'

      expect(current_path).to eq(new_admin_event_path)

      fill_in 'Title', with: 'Creamy Ranch Dressing'
      fill_in 'Supporting Act', with: "It's not self-indulgent when it's the best. By Newman, for Newman."
      fill_in 'Price', with: 29.99
      select "#{categories.first.title}", from: 'Category'
      select "#{venue.name}", from: 'Venue'
      click_on 'Add Event'

      expect(current_path).to eq(event_path(Event.first.venue, Event.first))
      expect(page).to have_content(Event.first.title)
      expect(page).to have_content(Event.first.supporting_act)
      expect(page).to have_content(Event.first.price)
      expect(page).to have_css("img[src*='#{Event.first.venue.image_path}']")
    end
  end

  context 'with valid information and photo' do
    scenario 'logged-in admin visits the events path' do
      admin = create(:admin)
      categories = create_list(:category, 3)
      venue = create(:venue)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit events_path
      click_on 'Add New Event'

      fill_in 'Title', with: 'Creamy Ranch Dressing'
      fill_in 'Supporting Act', with: "It's not self-indulgent when it's the best. By Newman, for Newman."
      fill_in 'Price', with: 29.99
      select "#{categories.first.title}", from: 'Category'
      select "#{venue.name}", from: 'Venue'
      # Commented out due to this being a static asset.
      # attach_file('Image', '/Users/Ryan/Desktop/No_available_image.gif')
      click_on 'Add Event'

      expect(current_path).to eq(event_path(Event.first.venue, Event.first))
      expect(page).to have_content(Event.first.title)
      expect(page).to have_content(Event.first.supporting_act)
      expect(page).to have_content(Event.first.price)
      expect(page).to have_css("img[src*='#{Event.first.venue.image_path}']")
    end
  end

  context 'with invalid event information' do
    scenario 'logged-in admin visits the events path' do
      admin = create(:admin)
      event = create(:event)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit events_path
      click_on 'Add New Event'
      fill_in 'Title', with: event.title
      fill_in 'Supporting Act', with: event.supporting_act
      click_on 'Add Event'

      expect(page).to have_content("Price can't be blank")
      expect(Event.count).to eq(1)
    end
  end

  context 'unauthorized user' do
    scenario 'logged-in user visits the events path' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit events_path

      expect(page).to_not have_link('Add New Event')
    end

    scenario 'logged-in user attempts to visit new event path' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_event_path

      expect(current_path).to eq(new_admin_event_path)
      expect(page).to have_css('img[src*="http://i.imgur.com/F4zRA3g.jpg"]')
    end

    scenario 'visitor visits the events path' do
      visit events_path

      expect(page).to_not have_link('Add New Event')
    end

    scenario 'visitor attempts to visit new event path' do
      visit new_admin_event_path

      expect(current_path).to eq(new_admin_event_path)
      expect(page).to have_css('img[src*="http://i.imgur.com/F4zRA3g.jpg"]')
    end
  end
end
