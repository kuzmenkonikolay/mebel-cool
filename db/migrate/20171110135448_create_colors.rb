class CreateColors < ActiveRecord::Migration[5.1]
  def change
    create_table :colors do |t|
      t.integer :model_id
      t.string :name
    end
  end
end
