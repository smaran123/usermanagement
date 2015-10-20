class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :configure_permitted_parameters, if: :devise_controller?
  #
  #  protected
  #
  #  def configure_permitted_parameters
  #    devise_parameter_sanitizer.for(:sign_up) << :username
  #  end
  #    
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      home_index_path
    else
      root_path
    end
  end 
  
  before_action :banned?
  def banned?

    if current_user.present? && !current_user.is_active?
      sign_out current_user
      flash[:error] = "this account has been suspended"
      root_path
    end

  end

end
