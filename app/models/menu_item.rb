class MenuItem < ApplicationRecord
  belongs_to :category
  has_one_attatched :thumbnail
end
