ActiveAdmin.register Order do
  index do
    selectable_column
    id_column
    column :phone_number
    column :email
    column :furnitures
    column :appliances
    actions
  end

  filter :email
  filter :phone_number
end
