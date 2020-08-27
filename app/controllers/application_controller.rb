class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_member!

  def after_sign_out_path_for(_resource)
    new_member_session_path
  end

  protected

  def configure_permitted_parameters
    # Need to revisit these params and decide whether "roles" are permited params
    keys = %i[first_name last_name castr talent admin profile_image password password_confirmation current_password]
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
    devise_parameter_sanitizer.permit(:account_update, keys: keys)
  end
end
