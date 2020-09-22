require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Rails >= 5
  setup do
    #sign_in members(:one)
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_job_url
    assert_response :success
  end

  test "should create job" do
    assert_difference("Job.count") do
      post jobs_url, params: { job: { company_name: @job.company_name, listing_expires: @job.listing_expires, member_id: @job.member_id, payment: @job.payment, payment_details: @job.payment_details, shoot_start_date: @job.shoot_start_date, shoot_end_date: @job.shoot_end_date, shoot_location: @job.shoot_location, special_instructions: @job.special_instructions, title: @job.title, union_status: @job.union_status, url: @job.url } }
    end

    assert_redirected_to job_url(Job.last)
  end

  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_url(@job)
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { company_name: @job.company_name, listing_expires: @job.listing_expires, member_id: @job.member_id, payment: @job.payment, payment_details: @job.payment_details, shoot_start_date: @job.shoot_start_date, shoot_end_date: @job.shoot_end_date, shoot_location: @job.shoot_location, special_instructions: @job.special_instructions, title: @job.title, union_status: @job.union_status, url: @job.url } }
    assert_redirected_to job_url(@job)
  end

  test "should destroy job" do
    assert_difference("Job.count", -1) do
      delete job_url(@job)
    end

    assert_redirected_to jobs_url
  end
end
