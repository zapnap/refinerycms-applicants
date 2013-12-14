class ApplicantsController < ApplicationController

  before_filter :find_page

  def thank_you
    @page = Page.find_by_link_url('/apply/thank-you', :include => [:parts, :slugs])
  end

  def new
    @applicant = Applicant.new
    @applicant.build_answers
  end

  def create
    @applicant = Applicant.new(params[:applicant])
    if @applicant.save
      if RefinerySetting.find_or_set(:applicant_recipients, []).present?
        ApplicantMailer.notification(@applicant, request).deliver
      end
      redirect_to thank_you_applicants_url
    else
      render :action => 'new'
    end
  end

protected

  def find_page
    @page = Page.find_by_link_url("/apply")
  end

end
