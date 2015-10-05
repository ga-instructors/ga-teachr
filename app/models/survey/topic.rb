class Survey::Topic < ActiveRecord::Base
  belongs_to :survey_questionnaire
end
