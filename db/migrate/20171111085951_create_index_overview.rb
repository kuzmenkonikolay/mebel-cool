class CreateIndexOverview < ActiveRecord::Migration[5.1]
  def change
    create_table :index_overviews do |t|
      t.text :description
    end
  end
end
