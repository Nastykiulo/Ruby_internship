class ApplicationController < ActionController::Base
  include Pagy::Backend
  #helper Webpacker::Helper
    before_action :authenticate_user!, :only => [:root, :home_about ]

    # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :email, :password, :password_confirmation, :remember_me) }
#     devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:first_nam, :email, :password, :remember_me) }
#   end
end
