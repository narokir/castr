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
    visit root_path
    sign_in members(:one)
    click_on "Post New Casting Notice"
    select("Albuquerque", from: "Shoot location")
    find_field("Start Date").set("2020-09-01")
    find_field("End Date").set("2020-09-01")
    fill_in "Title", with: @job.title
    fill_in "Description", with: @job.description
    fill_in "Payment", with: @job.payment
    fill_in "Payment details", with: @job.payment_details
    fill_in "Special instructions", with: @job.special_instructions
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "updating a Job" do
    sign_in members(:one)
    visit job_url(@job)
    click_on "Edit", match: :first
    fill_in "Title", with: @job.title
    fill_in "Description", with: @job.description
    fill_in "Payment", with: @job.payment
    fill_in "Payment details", with: @job.payment_details
    fill_in "Special instructions", with: @job.special_instructions
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
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
