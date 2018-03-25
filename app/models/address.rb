class Address < ApplicationRecord
  belongs_to :user

  validates :location, presence: true
  validates :postal_code, presence: true
  validates :postal_code, length: { is: 6 }

end
