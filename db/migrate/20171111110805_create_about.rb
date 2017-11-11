class CreateAbout < ActiveRecord::Migration[5.1]
  def change
    create_table :abouts do |t|
      t.boolean :current, default: false
      t.text :about_text

      t.timestamps null: false
    end
  end
end
