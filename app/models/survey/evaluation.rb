class Survey::Evaluation < ActiveRecord::Base
  belongs_to :survey_answer, class_name: 'Survey::Answer'
  belongs_to :student
  belongs_to :employee
end
