ActiveAdmin.register Appliance do
  permit_params :title, :price, :discount, :main_image, :description, :widths, :availability,
                :height, :depth, appliance_pictures_attributes: {}, appliance_color_ids: [], appliance_category_ids: [], appliance_picture_ids: []

  index do
    selectable_column
    id_column
    column :title
    column :price
    column :discount
    column :availability
    column :created_at
    actions
  end

  filter :title
  filter :availability
  filter :price
  filter :discount
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :appliance_categories, collection: ApplianceCategory.all, input_html: {class: "select2", style: 'width: 80%;'}
      f.input :availability
      f.input :appliance_colors, collection: ApplianceColor.all, input_html: {class: "select2", style: 'width: 80%;'}
      f.input :widths
      f.input :height
      f.input :depth
      f.input :price
      f.input :discount
      f.input :main_image
      f.input :description
      f.has_many :appliance_pictures, new_record: true do |e|
        e.input :file
      end
    end
    f.actions
  end

  controller do
    def create
      params[:appliance][:appliance_picture_ids] = []
      attributes = params[:appliance][:appliance_pictures_attributes]
      attributes.keys.each do |key|
        a_pic = AppliancePicture.create(file: attributes[key][:file])
        params[:appliance][:appliance_picture_ids] << a_pic.id
      end
      super
    end
  end
end
