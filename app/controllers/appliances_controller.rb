class AppliancesController < ApplicationController
  protect_from_forgery except: :search

  def index
    @categories = ApplianceCategory.all
    if params[:type] == 'category'
      @appliances = ApplianceCategory.find_by(name: params[:name]).appliances.last(30)
    elsif params[:type] == 'color'
      @appliances = ApplianceColor.find_by(name: params[:name]).appliances.last(30)
    else
      @appliances = Appliance.last(30)
    end
    @colors = ApplianceColor.all
  end

  def show_more
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
    session[:viewed_appliances] = [] if session[:viewed_appliances].blank?
    session[:viewed_appliances] << @appliance.id
  end

  def search
    @query = "?type=#{params[:type]}&name=#{params[:name]}"
    if params[:type] == 'category'
      @appliances = ApplianceCategory.find_by(name: params[:name]).appliances.last(30)
    elsif params[:type] == 'color'
      @appliances = ApplianceColor.find_by(name: params[:name]).appliances.last(30)
    end
    respond_to do |format|
      format.js {@appliances}
    end
  end
end
