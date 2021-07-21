class Order < ApplicationRecord
  belongs_to :user
  has_many :menu_items, through: :order_items
end
