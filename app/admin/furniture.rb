ActiveAdmin.register Furniture do
  permit_params :title, :price, :discount, :main_image, :description, :widths, :availability,
                :height, :depth, furniture_pictures_attributes: {}, color_ids: [], furniture_category_ids: [], furniture_picture_ids: []

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
      f.input :furniture_categories, collection: FurnitureCategory.all, input_html: {class: "select2", style: 'width: 80%;'}
      f.input :availability
      f.input :colors, collection: Color.all, input_html: {class: "select2", style: 'width: 80%;'}
      f.input :widths
      f.input :height
      f.input :depth
      f.input :price
      f.input :discount
      f.input :main_image
      f.input :description
      f.has_many :furniture_pictures, new_record: true do |e|
        e.input :file
      end
    end
    f.actions
  end

  controller do
    def create
      params[:furniture][:furniture_picture_ids] = []
      attributes = params[:furniture][:furniture_pictures_attributes]
      attributes.keys.each do |key|
        f_pic = FurniturePicture.create(file: attributes[key][:file])
        params[:furniture][:furniture_picture_ids] << f_pic.id
      end
      super
    end
  end
end
