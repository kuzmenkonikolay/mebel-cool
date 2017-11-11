ActiveAdmin.register Color do
  permit_params :name, :rgb

  index do
    selectable_column
    id_column
    column :name
    column :rgb
    actions
  end

  filter :name
  filter :rgb

  form do |f|
    f.inputs do
      f.input :name
      f.input :rgb
    end
    f.actions
  end
end
