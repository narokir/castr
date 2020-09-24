class AccountsController < ApplicationController
  before_action :authenticate_member!

  def index
    # @member = current_member
    # @member_jobs = current_member.jobs
  end

  def show
  end
end
