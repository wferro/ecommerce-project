# View class
class View < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
end
