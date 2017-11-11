class Appliance < ApplicationRecord
  has_many :appliance_pictures, :class_name => 'AppliancePicture', :foreign_key => 'model_id', dependent: :destroy
  has_and_belongs_to_many :appliance_colors, :class_name => 'ApplianceColor', :association_foreign_key => 'color_id'
  has_and_belongs_to_many :appliance_categories, :class_name => 'ApplianceCategory', :association_foreign_key => 'category_id'

  attr_accessor :appliance_pictures_attributes
  accepts_nested_attributes_for :appliance_pictures, allow_destroy: true

  mount_uploader :main_image, MainApplianceUploader

  enum availability: ['на складе', 'нет в наличии', 'под заказ']

  validates_presence_of :title, :main_image, :price, :discount
  validates :description, length: { minimum: 260}
end
