module ApplicationHelper
  def price_for_cart price, discount, quantity
    finished_price = ''
    if discount > 0
      finished_price = (price*(1-discount.to_f/100))*quantity.to_i
    else
      finished_price = price*quantity.to_i
    end
    finished_price.round(2)
  end

  def product_price price, discount
    if discount > 0
      (price*(1-discount.to_f/100)).round(2)
    else
      price.round(2)
    end
  end
end
