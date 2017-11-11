class MainsController < ApplicationController
  def index
    @single_images = SimpleImage.last(4)
    @carousel_images = CarouselImage.all
    @index_overviews = IndexOverview.last(4)
    @client_overviews = ClientOverview.all
    @main_products = {}
    MainProduct.last(3).each_with_index do |product, i|
      i += 1
      @main_products[i] = Furniture.find_by(id: product.product_id)
    end
  end
end
