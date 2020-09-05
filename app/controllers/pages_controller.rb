class PagesController < ApplicationController
  skip_before_action :authenticate_member!, only: [:home, :goodbye, :hello]

  def home
    @jobs = Job.where(featured: true).limit(6)
  end

  def hello
  end

  def goodbye
  end
end
