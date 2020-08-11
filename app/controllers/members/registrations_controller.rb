class Members::RegistrationsController < Devise::RegistrationsController
  protected

  # Overwrite update_resource
  def update_resource(resource, params)
    if current_member.provider == "facebook"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  def after_sign_up_path_for(_resource)
    root_path
  end
end
