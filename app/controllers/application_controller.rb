class ApplicationController < ActionController::Base
  include Pagy::Backend
  #helper Webpacker::Helper
    before_action :authenticate_user!, :only => [:root, :home_about ]
    #before_action :configure_permitted_parameters, if: :devise_controller?

protected
 
end
