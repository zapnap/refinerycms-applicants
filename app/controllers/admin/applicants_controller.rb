module Admin
  class ApplicantsController < Admin::BaseController

    crudify :applicant,
            :title_attribute => 'name'

    def index
      search_all_applicants if searching?
      paginate_all_applicants

      render :partial => 'applicants' if request.xhr?
    end

    def new
      @applicant = Applicant.new
      @applicant.build_answers if @applicant.answers.empty?
    end

  end
end
