class PagesController < ApplicationController
  skip_before_action :authenticate_member!, only: [:home, :goodbye, :hello]

  def home
    @jobs = Job.featured.all.limit(9)
  end

  def hello
  end

  def goodbye
  end
end
