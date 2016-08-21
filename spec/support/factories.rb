FactoryGirl.define do
  factory :event do
    title
    supporting_act "Norm Macdonald"
    price 199.99
    image_path
    category
    venue
    date "2014-09-18 12:30:59 -0700"
    factory :sold_out_event do
      status 1
    end
  end

  factory :venue do
    name
    image_path
    city 'Denver'
    state 'CO'
    capacity 500
    admin
  end

  factory :category do
    title { generate(:category_title) }
  end

  factory :order do
    user
    events { create_list(:event, 2) }
  end

  factory :user do
    username
    email
    password 'password'

    factory :admin do
      role 1
    end
  end

  sequence :username do |n|
    "user_#{n}"
  end

  sequence :email do |n|
    "user_#{n}@example.com"
  end

  sequence :name do |n|
    "Venue_#{n}"
  end

  sequence :category_title do |n|
    "Category_#{n}"
  end

  sequence :title do |n|
    "Event_#{n}"
  end

  sequence :image_path do |n|
    "https://robohash.org/#{n}"
  end

end
