class Brigadeiro < ApplicationRecord
  has_many :order_item
  has_many :order, through: :order_item
end
