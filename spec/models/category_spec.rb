require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many :events }
  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }
  it { should have_many(:venues).through(:events) }
  it { should validate_presence_of :slug }
  it { should validate_uniqueness_of(:slug).case_insensitive }
end
