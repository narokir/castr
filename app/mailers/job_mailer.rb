class JobMailer < ApplicationMailer
  default from: "Castr <notifications@castr.com>"

  def apply_email
    @job = params[:job]
    @talent = params[:talent]
    mail(to: @talent.email, subject: "You have applied")
  end
end
