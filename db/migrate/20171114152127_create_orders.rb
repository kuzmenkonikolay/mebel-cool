class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :phone_number
      t.string :email
      t.json :furnitures
      t.json :appliances

      t.timestamps null: false
    end
  end
end
