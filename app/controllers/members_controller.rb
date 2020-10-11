class MembersController < ApplicationController
  before_action :authenticate_member!

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = current_member
  end

  def delete_profile_photo
    @member = current_member
    current_member.profile_image.purge
    redirect_to member_path(@member), notice: "Photo Deleted"
  end

  def edit_password
    @member = current_member
  end

  def update_password
    @member = current_member
    if @member.update(member_params)
      # Sign in the member by passing validation in case their password changed
      bypass_sign_in(@member)
      redirect_to member_path(@member), notice: "Password successfully changed."
    else
      render "edit_password"
    end
  end

  private

  def member_params
    # NOTE: Using `strong_parameters` gem
    params.require(:member).permit(:password, :password_confirmation)
  end
end
