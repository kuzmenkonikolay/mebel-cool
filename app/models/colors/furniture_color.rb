class FurnitureColor < Color
  has_and_belongs_to_many :furnitures, :foreign_key => 'color_id'
end
