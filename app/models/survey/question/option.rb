class Survey::Question::Option < ActiveRecord::Base
  belongs_to :survey_question
  has_many :answers, class_name: 'Survey::Answer', foreign_key: :survey_question_option_id
end
