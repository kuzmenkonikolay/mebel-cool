class FurnituresController < ApplicationController
  def index
    @categories = FurnitureCategory.all
    @furnitures = Furniture.all
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
end
