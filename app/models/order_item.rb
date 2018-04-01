# OrderItem class
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :brigadeiro
end
