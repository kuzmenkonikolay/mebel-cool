ActiveAdmin.register ClientOverview do
  permit_params :file, :review

  index do
    selectable_column
    id_column
    actions
  end

  form do |f|
    f.inputs do
      f.input :file
      f.input :review
    end
    f.actions
  end
end
