require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    # sign_in members(:one)
    # @job = jobs(:one)
  end

  test "should get redirected when requesting edit" do
    sign_in members(:one)
    get edit_member_registration_path
    assert_response :success
  end

  test "should get edit pasword page " do
    sign_in members(:one)
    get edit_password_members_path
    assert_response :success
    assert_select "h4", "Change Password"
  end

  # test "should show profile" do
  #   sign_in members(:one)
  #   member_signed_in? == true
  #   get member_url(current_member)
  #   assert_response :success
  # end

  # test "should patch delete photo" do
  #   patch delete_profile_photo_member_url
  #   assert_redirected_to member_account_path
  # end
end
