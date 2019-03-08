module LoginSupport
  def sign_in_as(user)
    token = user.confirmation_token
    visit user_confirmation_path(confirmation_token: token)
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end
