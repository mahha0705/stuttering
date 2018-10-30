class ApplicationMailer < ActionMailer::Base
 default  bcc:      "info@kitsuon-soudan.com",
          reply_to: "info@kitsuon-soudan.com"
  layout 'mailer'
end
