class Survey::Response < ActiveRecord::Base
  belongs_to :questionnaire, foreign_key: :survey_questionnaire_id
  delegate :cohort, to: :questionnaire
  belongs_to :student
  has_many :answers
end
