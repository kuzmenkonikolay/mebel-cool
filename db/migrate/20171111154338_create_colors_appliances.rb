class CreateColorsAppliances < ActiveRecord::Migration[5.1]
  def change
    create_table :colors_appliances do |t|
      t.belongs_to :appliance, foreign_key: true
      t.belongs_to :color, foreign_key: true
    end
  end
end
