class Users::RegistrationsController < Devise::RegistrationsController
    # Override the action you want here.
    before_action :configure_sign_up_params, only: [:create]
    #before_filter :authorize_admin, only: :create
    before_action :authenticate_user!, :redirect_unless_admin,  only: [:new, :create]
    skip_before_action :require_no_authentication

  # GET /resource/sign_up
  def new
    super
  end
  def create
    # admins only
    super
  end
  #then the method called in the before action where you permit the parameters
  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :role])
  end
  
  private
  def redirect_unless_admin
    unless current_admin
      flash[:error] = "Only admins can do that"
      redirect_to root_path
    end
  end

  # This should probably be abstracted to ApplicationController
  # as shown by diego.greyrobot
  def authorize_admin
    return unless !current_admin
    redirect_to root_path, alert: 'Admins only!'
  end
end
