class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def callback_for_all_providers
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    provider = __callee__.to_s
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if request.env["omniauth.auth"].blank?
      set_flash_message(:notice, :failure, kind: provider.capitalize, reason: "") if is_navigational_format?
      redirect_to root_url && return
    end

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except('extra')
      set_flash_message(:notice, :failure, kind: provider.capitalize, reason: "ユーザー名,もしくはメールアドレスはすでに使用されています。") if is_navigational_format?
      redirect_to new_user_registration_url
    end
  end

  def failure
    set_flash_message(:notice, :failure, kind: provider.capitalize, reason: "") if is_navigational_format?
    redirect_to root_path
  end

  alias_method :twitter, :callback_for_all_providers
  alias_method :google,  :callback_for_all_providers

end
