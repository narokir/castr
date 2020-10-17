require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers # Rails >= 5
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "input[type = 'text']", id: "search"
  end

  test "creating a Job" do
    sign_in members(:one)
    visit jobs_url
    click_on "Post a Casting Call"
    fill_in "job[title]", with: @job.title
    fill_in "job[description]", with: @job.description
    # find_field("job[shoot_start_date]").set("2020-09-01")
    # find_field("job[shoot_end_date]").set("2020-09-01")
    select("Albuquerque", from: "job[shoot_location]")
    fill_in "job[payment]", with: @job.payment
    select("Day", from: "job[pay_interval]")
    fill_in "job[payment_details]", with: @job.payment_details
    fill_in "job[special_instructions]", with: @job.special_instructions
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "updating a Job" do
    sign_in members(:one)
    visit job_url(@job)
    click_on "Edit", match: :first
    fill_in "job[title]", with: "editing title"
    fill_in "Description", with: @job.description
    fill_in "Payment", with: @job.payment
    fill_in "Payment details", with: @job.payment_details
    fill_in "job[special_instructions]", with: @job.special_instructions
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "Preview a Job" do
    sign_in members(:one)
    visit jobs_url
    click_on "Post a Casting Call"
    fill_in "job[title]", with: @job.title
    fill_in "job[description]", with: @job.description
    click_on "Preview"
    assert_text "Preview Casting Call"
  end

  test "destroying a Job" do
    sign_in members(:one)
    visit job_url(@job)
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Job was successfully destroyed"
  end
end
