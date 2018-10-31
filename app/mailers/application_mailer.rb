class ApplicationMailer < ActionMailer::Base
   default reply_to: "info@kitsuon-soudan.com"
   layout 'mailer'
end
