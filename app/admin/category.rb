ActiveAdmin.register Category do
  permit_params :name, :type

  index do
    selectable_column
    id_column
    column :name
    column :type
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :type, collection: ['FurnitureCategory', 'ApplianceCategory'], input_html: {class: 'select2'}
    end
    f.actions
  end
end
