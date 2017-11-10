class CreateColorFurniture < ActiveRecord::Migration[5.1]
  def change
    create_table :colors_furnitures do |t|
      t.belongs_to :furniture, foreign_key: true
      t.belongs_to :color, foreign_key: true
    end
  end
end
