require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Rails >= 5
  setup do
    # sign_in members(:one)
    @job = jobs(:one)
    @unpublished = jobs(:two)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_job_url
    assert_redirected_to new_member_session_path
    follow_redirect!
    assert_response :success
    #assert_select "h2", "Log In via facebook"
    sign_in members(:one)
    get new_job_url
    assert_response :success
    # assert_select "h1", "Create Casting Call"
  end

  test "should create job" do
    sign_in members(:one)
    assert_difference("Job.count") do
      post jobs_url, params: { job: { company_name: @job.company_name, description: @job.description, listing_expires: @job.listing_expires, member_id: @job.member_id, payment: @job.payment, payment_details: @job.payment_details, shoot_start_date: @job.shoot_start_date, shoot_end_date: @job.shoot_end_date, shoot_location: @job.shoot_location, special_instructions: @job.special_instructions, title: "special title", union_status: @job.union_status, url: @job.url } }
    end

    assert_redirected_to job_url(Job.last)
  end

  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should not show unpublished job" do
    get job_url(@unpublished)
    assert_redirected_to root_url
  end

  test "should get edit" do
    get edit_job_url(@job)
    assert_redirected_to new_member_session_path
    follow_redirect!
    sign_in members(:one)
    get edit_job_url(@job)
    assert_response :success
  end

  test "should update job" do
    sign_in members(:one)
    patch job_url(@job), params: { job: { company_name: @job.company_name, description: @job.description, listing_expires: @job.listing_expires, member_id: @job.member_id, payment: @job.payment, payment_details: @job.payment_details, shoot_start_date: @job.shoot_start_date, shoot_end_date: @job.shoot_end_date, shoot_location: @job.shoot_location, special_instructions: @job.special_instructions, title: "special title", union_status: @job.union_status, url: @job.url } }
    assert_redirected_to job_url(@job)
  end

  test "should destroy job" do
    sign_in members(:one)
    assert_difference("Job.count", -1) do
      delete job_url(@job)
    end

    assert_redirected_to member_url
  end
end
