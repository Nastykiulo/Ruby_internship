class ApplicationController < ActionController::Base
    before_action :authenticate_user!, :only => [:root, :home_about ]
end
