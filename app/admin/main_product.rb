ActiveAdmin.register MainProduct do
  permit_params :product_id

  index do
    selectable_column
    id_column
    column :product_id
    actions
  end

  form do |f|
    f.inputs do
      f.input :product_id, collection: Furniture.all, input_html: {class: 'select2'}
    end
    f.actions
  end
end
