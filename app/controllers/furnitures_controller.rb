class FurnituresController < ApplicationController
  protect_from_forgery except: :search

  def index
    @categories = FurnitureCategory.all
    if params[:type] == 'category'
      @furnitures = FurnitureCategory.find_by(name: params[:name]).furnitures.last(30)
    elsif params[:type] == 'color'
      @furnitures = FurnitureColor.find_by(name: params[:name]).furnitures.last(30)
    else
      @furnitures = Furniture.all.last(30)
    end
    @colors = FurnitureColor.all
  end

  def show_more
    p '---------------------'
    p params
    p '---------------------'
    @categories = FurnitureCategory.all
    @colors = FurnitureColor.all
    if params[:type] == 'category'
      @furnitures = FurnitureCategory.find_by(name: params[:name]).furnitures
    elsif params[:type] == 'color'
      @furnitures = FurnitureColor.find_by(name: params[:name]).furnitures
    else
      @furnitures = Furniture.all
    end

    response do |format|
      format.js
    end
  end

  def latest
    @latest = Furniture.last(6)
    @categories = []
    @latest.each do |product|
      @categories << product.furniture_categories.pluck(:name)
    end
    @categories = @categories.flatten.compact.uniq
  end

  def show
    @categories = FurnitureCategory.all
    @colors = FurnitureColor.all
    @furniture = Furniture.find_by(id: params[:id])
    session[:viewed_furnitures] = [] if session[:viewed_furnitures].blank?
    session[:viewed_furnitures] << @furniture.id
  end

  def search
    @query = "?type=#{params[:type]}&name=#{params[:name]}"
    if params[:type] == 'category'
      @products = FurnitureCategory.find_by(name: params[:name]).furnitures.last(30)
    elsif params[:type] == 'color'
      @products = FurnitureColor.find_by(name: params[:name]).furnitures.last(30)
    end
    respond_to do |format|
        format.js {@products}
    end
  end
end
