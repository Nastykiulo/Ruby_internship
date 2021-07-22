class Students::RegistrationsController < Devise::RegistrationsController
    # Override the action you want here.
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_permitted_parameters
  # GET /resource/sign_up
  def new
    super
  end
  #then the method called in the before action where you permit the parameters
  def create
    params[:user] = params[:user]&.merge(type: 'Studens')
    super
  end  
  protected  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[type])
  end
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :role])
  end
end
