class MenuItem < ApplicationRecord
  belongs_to :category
  has_one_attached :thumbnail
  belongs_to :user
end
