class Order < ApplicationRecord
  serialize :furnitures, Array
  serialize :appliances, Array
end
