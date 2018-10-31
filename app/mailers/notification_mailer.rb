class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.send_when_get_answer.subject
  #
  def send_when_get_answer(user,answer)
    @user = user
    @answer = answer
    @url = question_url(answer.question)
    mail to: user.email , subject: '吃音Q&A 質問に対する回答がありました。'
  end

  def send_when_get_comment(user,comment)
    @user = user
    @comment = comment
    @url = question_url(comment.answer.question)
    mail to:  user.email , subject: '吃音Q&A 回答に対するコメントがありました。'
  end
end
