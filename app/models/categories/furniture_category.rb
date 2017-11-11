class FurnitureCategory < Category
  has_and_belongs_to_many :furnitures, :foreign_key => 'category_id'
end
