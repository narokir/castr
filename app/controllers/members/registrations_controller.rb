class Members::RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_sign_up_path_for(_resource)
    root_path
  end

  def after_update_path_for(resource)
    member_account_path
  end
end
