class CreateCategoriesAplliances < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_aplliances do |t|
      t.belongs_to :category, foreign_key: true
      t.belongs_to :appliance, foreign_key: true
    end
  end
end
