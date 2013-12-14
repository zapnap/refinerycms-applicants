class ApplicantMailer < ActionMailer::Base
  def notification(applicant_id, request)
    @applicant = Applicant.find(applicant_id)
    @host = request.host

    mail(
      :subject => "[#{RefinerySetting[:site_name]}] New Applicant: #{@applicant.name}",
      :to => RefinerySetting[:applicant_recipients],
      :from => "\"#{RefinerySetting[:site_name]}\" <no-reply@#{@host}>",
      :reply_to => @applicant.email,
    )
  end
end
