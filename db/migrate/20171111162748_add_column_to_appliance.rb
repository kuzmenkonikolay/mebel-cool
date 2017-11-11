class AddColumnToAppliance < ActiveRecord::Migration[5.1]
  def change
    add_column :appliances, :main_image, :string
    add_column :appliances, :availability, :integer
  end
end
