require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to :venue }
  it { should belong_to :category }
  it { should have_many :order_events }
  it { should have_many(:orders).through(:order_events) }
  it { should validate_uniqueness_of(:title).scoped_to(:venue_id, :date) }
  it { should validate_presence_of :price }
  it { should validate_presence_of :title }
  it { should have_db_column(:status).with_options(default: 'upcoming') }
  it { should validate_presence_of :venue }
  it { should validate_presence_of :category }
  it { should validate_presence_of :slug }
  it { should validate_uniqueness_of(:slug).case_insensitive }
  it { should validate_numericality_of(:price).is_greater_than(0) }
  it { should have_db_column(:date).with_options(default: '2014-09-18 12:30:59 UTC') }

  it "should give venue name" do
    event = create(:event)
    expect(event.venue.name).to eq(event.venue_name)
  end

  it "should return tell if an event is sold out" do
    event = create(:sold_out_event)
    expect(event.past_event?).to eq(true)
  end
end
