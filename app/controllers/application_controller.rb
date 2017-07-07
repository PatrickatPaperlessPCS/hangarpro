class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :logged_in, unless: :devise_controller?
  
  def after_sign_in_path_for(resource)
    case resource
    when User
      hangars_path
    when Owner
      pages_owners_dashboard_path
    end
  end  


	before_filter :configure_permitted_parameters, if: :devise_controller?
    
     protected

    def logged_in
      unless current_user || current_owner
        redirect_to root_path, notice: "You must sign in "
      end
    end

    def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:admin, :first_name, :last_name, :signed_lease, :lease_expires, :company, :airport_id])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:admin, :first_name, :last_name, :signed_lease, :lease_expires, :company, :airport_id])
    end
end
