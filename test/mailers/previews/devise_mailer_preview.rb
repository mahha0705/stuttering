# Preview all emails at http://localhost:3000/rails/mailers/devise_mailer
class DeviseMailerPreview < ActionMailer::Preview
  def confirmation_instructions
    Devise::Mailer.confirmation_instructions(User.new(id: 20, name: "サクライ", email: "naoya.sakurai.0705@gmail.com"), Devise.friendly_token[0,20])
  end
  def reset_password_instructions
    Devise::Mailer.reset_password_instructions(User.new(id: 20, name: "サクライ", email: "naoya.sakurai.0705@gmail.com"), Devise.friendly_token[0,20])
  end
end
