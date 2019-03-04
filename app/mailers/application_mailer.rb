class ApplicationMailer < ActionMailer::Base
   # add_template_helper(MailerHelper)
  default reply_to: ENV['MAIL_ADRESS']
  layout 'mailer'
end
