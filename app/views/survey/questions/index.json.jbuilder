json.array!(@survey_questions) do |survey_question|
  json.extract! survey_question, :id, :survey_questionnaire_id, :ordinal, :topics, :prompt, :open_ended, :format, :valuation
  json.url survey_question_url(survey_question, format: :json)
end
