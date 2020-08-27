class PagesController < ApplicationController
  skip_before_action :authenticate_member!, only: [:home]

  def home
    @jobs = Job.where(featured: true).limit(6)
  end
end
