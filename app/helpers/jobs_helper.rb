module JobsHelper
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
