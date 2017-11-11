class AddColumnToColor < ActiveRecord::Migration[5.1]
  def change
    add_column :colors, :rgb, :string
  end
end
