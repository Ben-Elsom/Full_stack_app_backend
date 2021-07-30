class MenuItem < ApplicationRecord
  belongs_to :category
  has_one_attached :thumbnail
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: {greater_than: 1}
end
