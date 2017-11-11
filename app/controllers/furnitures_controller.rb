class FurnituresController < ApplicationController
  protect_from_forgery except: :search

  def index
    @categories = FurnitureCategory.all
    if params[:type] == 'category'
      @furnitures = FurnitureCategory.find_by(name: params[:name]).furnitures
    elsif params[:type] == 'color'
      @furnitures = Color.find_by(name: params[:name]).furnitures
    else
      @furnitures = Furniture.all
    end
    @colors = Color.all
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
    @colors = Color.all
    @furniture = Furniture.find_by(id: params[:id])
  end

  def search
    if params[:type] == 'category'
      @products = FurnitureCategory.find_by(name: params[:name]).furnitures
    elsif params[:type] == 'color'
      @products = Color.find_by(name: params[:name]).furnitures
    end
    respond_to do |format|
        format.js {@products}
    end
  end
end
