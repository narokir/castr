require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Rails >= 5

  test "should get redirected to sign in if not loged in" do
    get member_account_url
    assert_redirected_to new_member_session_path
    follow_redirect!
    assert_response :success
  end
  test "should get show via authentication" do
    get member_account_url
    assert_redirected_to new_member_session_path
    follow_redirect!
    sign_in members(:one)
    assert_response :success
  end
end
