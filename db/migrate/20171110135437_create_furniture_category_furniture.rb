class CreateFurnitureCategoryFurniture < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_furnitures do |t|
      t.belongs_to :category, foreign_key: true
      t.belongs_to :furniture, foreign_key: true
    end
  end
end
