json.array!(@survey_questionnaires) do |survey_questionnaire|
  json.extract! survey_questionnaire, :id, :cohort_id, :ordinal, :title, :introduction
  json.url survey_questionnaire_url(survey_questionnaire, format: :json)
end
