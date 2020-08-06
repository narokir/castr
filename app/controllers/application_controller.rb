class ApplicationController < ActionController::Base
  before_action :authenticate_member!

  def after_sign_out_path_for(resource)
    new_member_session_path
  end
end
