require "application_system_test_case"

class MembersTest < ApplicationSystemTestCase
  test "visiting registration page" do
    visit new_member_registration_url
    assert_selector "h2", text: "Sign Up"
  end
end
