class DevisePreview < ActionMailer::Preview
  def confirmation_instructions
    Devise::Mailer.confirmation_instructions(User.new(id: 20, name: "サクライ", email: "naoya.sakurai.0705@gmail.com"), Devise.friendly_token[0,20])
  end
end

