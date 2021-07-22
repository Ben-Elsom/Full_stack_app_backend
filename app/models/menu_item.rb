class MenuItem < ApplicationRecord
  belongs_to :category
  has_many :orders, through: :order_item
  has_one_attached :thumbnail
end
