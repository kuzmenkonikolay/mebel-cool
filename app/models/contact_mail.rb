class ContactMail < ApplicationRecord
  validates_presence_of :name, :phone, :email, :message
end
