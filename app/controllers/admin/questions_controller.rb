module Admin
  class QuestionsController < Admin::BaseController

    crudify :question,
            :title_attribute => 'name'

    def index
      search_all_questions if searching?
      paginate_all_questions

      render :partial => 'questions' if request.xhr?
    end

  end
end
