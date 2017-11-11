class FurnitureColor < Color
  has_and_belongs_to_many :furnitures, :foreign_key => 'furniture_id'
end
