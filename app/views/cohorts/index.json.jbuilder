json.array!(@cohorts) do |cohort|
  json.extract! cohort, :id, :campus_id, :course_id, :name, :begins_at, :ends_at
  json.url cohort_url(cohort, format: :json)
end
