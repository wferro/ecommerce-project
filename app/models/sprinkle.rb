class Sprinkle < ApplicationRecord
  has_many :brigadeiro
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :price, presence: true
end
