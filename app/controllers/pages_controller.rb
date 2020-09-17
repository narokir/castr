class PagesController < ApplicationController
  skip_before_action :authenticate_member!, only: [:home, :goodbye, :hello]

  def home
    @jobs = Job.published.all.limit(5)
  end

  def hello
  end

  def goodbye
  end
end
