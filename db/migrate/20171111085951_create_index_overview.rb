class CreateIndexOverview < ActiveRecord::Migration[5.1]
  def change
    create_table :index_overviews do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
