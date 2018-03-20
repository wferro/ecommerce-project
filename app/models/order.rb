class Order < ApplicationRecord
  has_many :order_item
  has_many :brigadeiro, through: :order_item
end
