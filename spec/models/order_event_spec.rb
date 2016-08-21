require 'rails_helper'

RSpec.describe OrderEvent, type: :model do
  it { should belong_to :order }
  it { should belong_to :event }
end
