class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  RECEIVE_EMAIL = 'a.k.mebbel@gmail.com'.freeze
end
