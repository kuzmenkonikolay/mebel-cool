ActiveAdmin.register SimpleImage do
  permit_params :file

  index do
    selectable_column
    id_column
    actions
  end

  form do |f|
    f.inputs do
      f.input :file
    end
    f.actions
  end
end
