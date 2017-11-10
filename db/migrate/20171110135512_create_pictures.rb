class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :type
      t.integer :model_id
      t.string :file

      t.timestamps null: false
    end
  end
end
