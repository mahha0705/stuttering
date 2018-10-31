class ApplicationMailer < ActionMailer::Base
   # add_template_helper(MailerHelper)
   default reply_to: "info@kitsuon-soudan.com"
   layout 'mailer'
end
