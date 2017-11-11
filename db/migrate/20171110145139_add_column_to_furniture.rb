class AddColumnToFurniture < ActiveRecord::Migration[5.1]
  def change
    add_column :furnitures, :main_image, :string
  end
end
