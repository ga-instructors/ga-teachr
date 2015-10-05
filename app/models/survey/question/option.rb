class Survey::Question::Option < ActiveRecord::Base
  belongs_to :survey_question
end
