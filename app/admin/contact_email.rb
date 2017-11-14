ActiveAdmin.register ContactMail do
  permit_params :name, :email, :phone, :message

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone
    column :message
    actions
  end

  filter :name
  filter :email
  filter :phone

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :phone
      f.input :message
    end
    f.actions
  end
end
