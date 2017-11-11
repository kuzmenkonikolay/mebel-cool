ActiveAdmin.register IndexOverview do
  permit_params :description, :title

  index do
    selectable_column
    id_column
    column :title
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
    end
    f.actions
  end
end
