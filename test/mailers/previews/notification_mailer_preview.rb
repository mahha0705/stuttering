# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/send_when_get_answer

  def send_when_get_answer
    NotificationMailer.send_when_get_answer(User.first, Answer.first)
  end

  def send_when_get_comment
    NotificationMailer.send_when_get_comment(User.first, Comment.first)
  end

end
