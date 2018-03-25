class Brigadeiro < ApplicationRecord
  has_many :order_item
  has_many :order, through: :order_item
  belongs_to :sprinkle
  belongs_to :chocoball

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :sprinkle_id, presence: true
  validates :chocoball_id, presence: true

  #mount_uploader :image, ImageUploader

end
