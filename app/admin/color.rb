ActiveAdmin.register Color do
  permit_params :name, :rgb, :type

  index do
    selectable_column
    id_column
    column :name
    column :rgb
    column :type
    actions
  end

  filter :name
  filter :rgb

  form do |f|
    f.inputs do
      f.input :name
      f.input :rgb
      f.input :type, collection: ['FurnitureColor', 'ApplianceColor'], input_html: {class: 'select2'}
    end
    f.actions
  end
end
