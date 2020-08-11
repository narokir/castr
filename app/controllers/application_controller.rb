class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_member!

  def after_sign_out_path_for(resource)
    new_member_session_path
  end

  protected

  def configure_permitted_parameters
    keys = [:first_name, :last_name, :castr, :talent, :profile_image]
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
    devise_parameter_sanitizer.permit(:account_update, keys: keys)
  end
end
