# Order class
class Order < ApplicationRecord
  belongs_to :user
  belongs_to :status

  has_many :order_item
  has_many :brigadeiro, through: :order_item
end
