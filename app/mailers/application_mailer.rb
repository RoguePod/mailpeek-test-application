# Public: ApplicationMailer
class ApplicationMailer < ActionMailer::Base
  default from: '<Mailpeek> no-reply@mailpeek.com'
  layout 'mailer'
end
