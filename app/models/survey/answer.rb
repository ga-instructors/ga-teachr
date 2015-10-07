class Survey::Answer < ActiveRecord::Base
  belongs_to :survey_question
  belongs_to :student
  belongs_to :survey_question_option
end
