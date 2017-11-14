class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_categories

  private

  def set_categories
    @footer_furniture_categories = FurnitureCategory.last(7)
    @footer_appliance_categories = ApplianceCategory.last(7)
  end
end
