class ApplianceCategory < Category
  has_and_belongs_to_many :appliances
end
