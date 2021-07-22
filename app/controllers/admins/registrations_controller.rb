class Admins::RegistrationsController < Devise::RegistrationsController
    # Override the action you want here.
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_permitted_parameters
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
    skip_before_action :require_no_authentication, only: [:new, :create]
  # GET /resource/sign_up
  def new
    if admin_signed_in?
      super
    else
      redirect_to root_path
    end
  end
  #then the method called in the before action where you permit the parameters
  def create
    if admin_signed_in?
      params[:user] = params[:user]&.merge(type: 'Admin')
      super
    else
      redirect_to root_path
    end
  end  
  protected  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[type])
  end
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :role])
  end
end
