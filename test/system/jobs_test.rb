require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "creating a Job" do
    visit jobs_url
    click_on "New Job"

    fill_in "Company name", with: @job.company_name
    fill_in "Listing expires", with: @job.listing_expires
    fill_in "Member", with: @job.member_id
    fill_in "Payment", with: @job.payment
    fill_in "Payment details", with: @job.payment_details
    fill_in "Shoot date", with: @job.shoot_start_date
    fill_in "Shoot location", with: @job.shoot_location
    fill_in "Special instructions", with: @job.special_instructions
    fill_in "Title", with: @job.title
    fill_in "Union status", with: @job.union_status
    fill_in "Url", with: @job.url
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "updating a Job" do
    visit jobs_url
    click_on "Edit", match: :first

    fill_in "Company name", with: @job.company_name
    fill_in "Listing expires", with: @job.listing_expires
    fill_in "Member", with: @job.member_id
    fill_in "Payment", with: @job.payment
    fill_in "Payment detials", with: @job.payment_detials
    fill_in "Shoot date", with: @job.shoot_date
    fill_in "Shoot location", with: @job.shoot_location
    fill_in "Special instructions", with: @job.special_instructions
    fill_in "Title", with: @job.title
    fill_in "Union status", with: @job.union_status
    fill_in "Url", with: @job.url
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "destroying a Job" do
    visit jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job was successfully destroyed"
  end
end
