module ApplicantsHelper
  def answer_input_options(answer)
    options = {}

    if answer.answer_type == 'text'
      options[:rows] = 6
    end

    if answer.character_limit?
      options[:maxlength] = answer.character_limit
    end

    options
  end
end
