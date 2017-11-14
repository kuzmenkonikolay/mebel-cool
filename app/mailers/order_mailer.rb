class OrderMailer < ApplicationMailer
  default from: 'AKMebel <a.k.mebbel@gmail.com>'
  layout 'mailer'

  def create_order order_id
    @order = Order.find_by(id: order_id)

    mail( :to => RECEIVE_EMAIL,
          :subject => "Кто-то сделал заказ!" )
  end
end
