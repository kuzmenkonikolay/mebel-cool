class FurnituresController < ApplicationController
  def index
    @categories = FurnitureCategory.all
    @furnitures = Furniture.all
    @colors = Color.all
  end

  def latest
  end

  def show
    @categories = FurnitureCategory.all
    @colors = Color.all
    @furniture = Furniture.find_by(id: params[:id])
  end
end
