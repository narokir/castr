class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :persist_path, :authenticate_member!

  def after_sign_out_path_for(member)
    goodbye_path
  end

  def after_sign_in_path_for(resource)
    if session[:last_visited_path].present?
      session[:last_visited_path]
    else
      root_path
    end
  end

  private

  def persist_path
    unless Rails.configuration.ignored_paths.include?(request.path) || request.xhr?
      session[:last_visited_path] = request.path
    end
  end

  protected

  def configure_permitted_parameters
    # Need to revisit these params and decide whether "roles" are permited params
    keys = %i[first_name last_name castr talent admin profile_image password password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
    devise_parameter_sanitizer.permit(:account_update, keys: keys)
  end
end
