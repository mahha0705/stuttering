class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.send_when_get_answer.subject
  #
  def send_when_get_answer(user,answer)
    @user = user
    @answer = answer
    mail to:      user.email , subject: '吃音相談サイト質問に対する回答がありました。'
  end
end
