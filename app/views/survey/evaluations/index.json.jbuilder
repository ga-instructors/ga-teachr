json.array!(@survey_evaluations) do |survey_evaluation|
  json.extract! survey_evaluation, :id, :survey_response_id, :survey_question_id, :student_id, :employee_id, :value, :manifest
  json.url survey_evaluation_url(survey_evaluation, format: :json)
end
