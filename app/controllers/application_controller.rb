class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, 
  if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update) { |u|
         u.permit(:first_name, :last_name, :avatar, :email, :password, :password_confirmation,
          :current_password) 
    }
  end
end
