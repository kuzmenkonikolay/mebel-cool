class AppliancesController < ApplicationController
  protect_from_forgery except: :search

  def index
    @categories = ApplianceCategory.all
    if params[:type] == 'category'
      @appliances = ApplianceCategory.find_by(name: params[:name]).appliances
    elsif params[:type] == 'color'
      @appliances = ApplianceColor.find_by(name: params[:name]).appliances
    else
      @appliances = Appliance.all
    end
    @colors = ApplianceColor.all
  end

  def show
    @categories = ApplianceCategory.all
    @colors = ApplianceColor.all
    @appliance = Appliance.find_by(id: params[:id])
  end

  def search
    if params[:type] == 'category'
      @appliances = ApplianceCategory.find_by(name: params[:name]).appliances
    elsif params[:type] == 'color'
      @appliances = ApplianceColor.find_by(name: params[:name]).appliances
    end
    respond_to do |format|
      format.js {@appliances}
    end
  end
end
