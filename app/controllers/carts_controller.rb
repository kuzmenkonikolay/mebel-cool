class CartsController < ApplicationController

  def add_to_cart
    # session[:furniture] = {}
    # session[:appliance] = {}
    if params[:type] == 'furniture'
      session[:furniture] = {} if session[:furniture].blank?
      session[:furniture][params[:product_id]] = Hash.new
      session[:furniture][params[:product_id]] = {quantity: params[:quantity], color: params[:color]}
    elsif params[:type] == 'appliance'
      session[:appliance] = {} if session[:appliance].blank?
      session[:appliance][params[:product_id]] = Hash.new
      session[:appliance][params[:product_id]] = {quantity: params[:quantity], color: params[:color]}
    end

    render json: {status: 'success', msg: 'Добавлено в карзину', any_product: check_products}
  end

  def index
    @furnitures = []
    @appliances = []
    session[:furniture].keys.each do |key|
      @furnitures << { furniture: Furniture.find_by(id: key), color: session[:furniture][key][:color], quantity: session[:furniture][key][:quantity] }
    end

    session[:appliance].keys.each do |key|
      @appliances << { appliance: Furniture.find_by(id: key), color: session[:appliance][key][:color], quantity: session[:appliance][key][:quantity] }
    end
  end

  private

  def check_products
    session[:furniture].present? || session[:appliance].present?
  end
end
