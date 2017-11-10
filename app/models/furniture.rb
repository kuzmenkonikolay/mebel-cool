class Furniture < ApplicationRecord
  has_many :pictures, :class_name => 'FurniturePicture', :foreign_key => 'model_id', dependent: :destroy
  has_and_belongs_to_many :colors
  has_and_belongs_to_many :furniture_categories

end
