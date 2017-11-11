ActiveAdmin.register About do
  permit_params :about_text, :current

  index do
    selectable_column
    id_column
    actions
  end

  form do |f|
    f.inputs do
      f.input :current
      f.input :about_text, as: :html_editor
    end
    f.actions
  end
end
