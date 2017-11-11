class Furniture < ApplicationRecord
  has_many :furniture_pictures, :class_name => 'FurniturePicture', :foreign_key => 'model_id', dependent: :destroy
  has_and_belongs_to_many :colors
  has_and_belongs_to_many :furniture_categories

  attr_accessor :furniture_pictures_attributes
  accepts_nested_attributes_for :furniture_pictures, allow_destroy: true

  mount_uploader :main_image, MainImageUploader

  enum availability: ['на складе', 'нет в наличии', 'под заказ']

  validates_presence_of :title, :main_image, :price, :discount
  validates :description, length: { minimum: 260}
end
