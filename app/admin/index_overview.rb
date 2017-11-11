ActiveAdmin.register IndexOverview do
  permit_params :description

  index do
    selectable_column
    id_column
    actions
  end

  form do |f|
    f.inputs do
      f.input :description
    end
    f.actions
  end
end
