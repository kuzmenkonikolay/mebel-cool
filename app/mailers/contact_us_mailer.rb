class ContactUsMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def contact_us(mail_id)
    @mail = ContactMail.find_by(id: mail_id)

    mail( :to => RECEIVE_EMAIL,
          :subject => "#{@mail.name} хочет связаться." )
  end
end
