class Sprinkle < ApplicationRecord
  has_many :brigadeiro
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
