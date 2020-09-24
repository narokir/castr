module JobsHelper
  #Change color of Job status.
  def published?(job)
    if job.published?
      @class = "success"
      @status = "Published"
    else
      @class = "primary"
      @status = "Pending"
    end
  end
end
