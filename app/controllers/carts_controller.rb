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
    redirect_to root_path unless check_products
    @furnitures = []
    @appliances = []
    session[:furniture].keys.each do |key|
      @furnitures << { furniture: Furniture.find_by(id: key), color: FurnitureColor.find_by(id: session[:furniture][key]['color']), quantity: session[:furniture][key]['quantity'] }
    end if  session[:furniture].present?

    session[:appliance].keys.each do |key|
      @appliances << { appliance: Appliance.find_by(id: key), color: ApplianceColor.find_by(id: session[:appliance][key]['color']), quantity: session[:appliance][key]['quantity'] }
    end if session[:appliance].present?
  end

  def create_order
    furnitures = []
    appliances = []
    session[:furniture].keys.each do |key|
      furnitures << { furniture_id: key, color: session[:furniture][key]['color'], quantity: session[:furniture][key]['quantity'] }
    end
    session[:appliance].keys.each do |key|
      appliances << { appliance_id: key, color: session[:appliance][key]['color'], quantity: session[:appliance][key]['quantity'] }
    end
    order = Order.new(phone_number: params[:number], email: params[:email], furnitures: furnitures, appliances: appliances)

    if order.save
      render json: {status: 'success', msg: 'Заказ Оформлен'}
      OrderMailer.create_order(order.id).deliver
      session[:furniture] = {}
      session[:appliance] = {}
    else
      render json: {status: 'error', msg: 'Что то пошло не так'}
    end
  end

  def remove_furniture_from_cart
    @furnitures = []
    session[:furniture].except!(params[:product_id])
    session[:furniture].keys.each do |key|
      @furnitures << { furniture: Furniture.find_by(id: key), color: FurnitureColor.find_by(id: session[:furniture][key]['color']), quantity: session[:furniture][key]['quantity'] }
    end

    response do |format|
      format.js
    end
  end

  def remove_appliance_from_cart
    @appliances = []
    session[:appliance].except!(params[:product_id])
    session[:appliance].keys.each do |key|
      @appliances << { appliance: Appliance.find_by(id: key), color: ApplianceColor.find_by(id: session[:appliance][key]['color']), quantity: session[:appliance][key]['quantity'] }
    end

    response do |format|
      format.js
    end
  end

  private

  def check_products
    session[:furniture].present? || session[:appliance].present?
  end
end
