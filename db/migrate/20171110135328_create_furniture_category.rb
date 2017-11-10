class CreateFurnitureCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :furniture_categories do |t|
      t.string :name
    end
  end
end
