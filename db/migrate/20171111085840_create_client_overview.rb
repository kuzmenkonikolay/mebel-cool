class CreateClientOverview < ActiveRecord::Migration[5.1]
  def change
    create_table :client_overviews do |t|
      t.string :file
      t.text   :review

      t.timestamps null: false
    end
  end
end
