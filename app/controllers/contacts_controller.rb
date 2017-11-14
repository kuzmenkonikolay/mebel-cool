class ContactsController < ApplicationController
  def contact_us
    @contact_mail = ContactMail.new
  end

  def create
    @contact_mail = ContactMail.new(contact_mail_params)
    if @contact_mail.save
      ContactUsMailer.contact_us(@contact_mail.id).deliver
      redirect_to root_path
    else
      render :contact_us
    end
  end

  private

  def contact_mail_params
    params.require(:contact_mail).permit(:name, :email, :phone, :message)
  end
end
