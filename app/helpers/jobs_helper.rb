module JobsHelper
  def published?(job)
    if job.published?
      p "Published"
    else
      p "Pending"
    end
  end
end
