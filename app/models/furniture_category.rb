class FurnitureCategory < ApplicationRecord
  has_and_belongs_to_many :furnitures
end
