require "application_system_test_case"

class MembersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers # Rails >= 5

  test "visiting registration page" do
    visit new_member_registration_url
    assert_selector "h2", text: "Sign Up"
  end

  test "login with facebook" do
    visit new_member_session_url
    click_on "facebook"
    #assert_redirect :success
    # expect(page).to have_content "Log Into Facebook"
    # assert_selector "div", text: "Log Into Facebook"
  end
end
