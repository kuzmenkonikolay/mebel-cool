class ApplianceColor < Color
  has_and_belongs_to_many :appliances, :foreign_key => 'appliance_id'
end