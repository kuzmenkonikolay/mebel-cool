class CreateColorsAppliances < ActiveRecord::Migration[5.1]
  def change
    create_table :appliances_colors do |t|
      t.belongs_to :appliance, foreign_key: true
      t.belongs_to :color, foreign_key: true
    end
  end
end
