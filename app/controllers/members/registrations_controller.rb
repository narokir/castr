class Members::RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    resource.update_without_password(params.except(:current_password))
  end

  def after_sign_up_path_for(_resource)
    root_path
  end

  def delete_profile_foto
  end
end
