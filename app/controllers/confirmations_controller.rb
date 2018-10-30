class ConfirmationsController < Devise::ConfirmationsController

    def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      set_flash_message!(:notice, :confirmed)
      respond_with_navigational(resource){
        sign_in(resource)
        redirect_to root_path}
        # after_confirmation_path_for(resource_name, resource) }
    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
    end
  end

  # private
  # def after_confirmation_path_for(resource_name, resource)
    # sign_in(resource) # In case you want to sign in the user
    # your_new_after_confirmation_path

    # controller: :devise, controller: :sessions, action: :create

    # user_session_path(resource)

  # end
end
