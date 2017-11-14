module ApplicationHelper
  def price_for_cart price, discount, quantity
    finished_price = ''
    if discount > 0
      finished_price = (price*(1-discount.to_f/100))*quantity.to_i
    end
    finished_price.round(2)
  end
end
