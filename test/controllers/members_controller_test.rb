require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Rails >= 5
  setup do
    sign_in members(:one)
    # @job = jobs(:one)
  end

  test "should get redirected when requesting edit" do
    get edit_member_url
    assert_response :success
  end

  test "should patch delete photo" do
    patch delete_profile_photo_member_url
    assert_redirected_to member_account_path
  end
end
