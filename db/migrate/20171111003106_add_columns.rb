class AddColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :furnitures, :availability, :integer
  end
end
