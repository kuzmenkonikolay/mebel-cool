class CreateAppliances < ActiveRecord::Migration[5.1]
  def change
    create_table :appliances do |t|
      t.string :title
      t.text   :description
      t.float  :price
      t.integer :discount, default: 0
      t.float  :widths
      t.float  :height
      t.float  :depth

      t.timestamps null: false
    end
  end
end
