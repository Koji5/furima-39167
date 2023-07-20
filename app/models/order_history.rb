class OrderHistory < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :order_address
end
