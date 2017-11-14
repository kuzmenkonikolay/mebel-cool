class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  RECEIVE_EMAIL = 'kuz-kol@mail.ru'.freeze
end
