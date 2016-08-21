require 'rails_helper'

RSpec.describe Venue, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :events }
  it { should have_many(:categories).through(:events) }
  it { should validate_presence_of :image_path }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :slug }
  it { should validate_uniqueness_of(:slug).case_insensitive }

  it "should be able to display its location" do
    venue = create(:venue)
    expect(venue.location).to eq("#{venue.city}, #{venue.state}")
  end
end
