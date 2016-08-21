class OrderEvent < ApplicationRecord
  belongs_to :event
  belongs_to :order
end
