class ApplianceColor < Color
  has_and_belongs_to_many :appliances, :foreign_key => 'color_id'
end
