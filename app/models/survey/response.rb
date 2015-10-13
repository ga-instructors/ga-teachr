class Survey::Response < ActiveRecord::Base
  belongs_to :questionnaire, foreign_key: :survey_questionnaire_id
  belongs_to :student
  has_many :answers, foreign_key: :survey_response_id, dependent: :destroy
  accepts_nested_attributes_for :answers
  delegate :cohort, to: :questionnaire

  def questions
    questionnaire.questions.map do |question|
      [question, answers.find_or_create_by(question: question)]
    end
  end

  def finish!
    questions.each do |question, answer|
      if answer.question_option
        answer.evaluation = Evaluation.new value: answer.question_option
      end
    end
    update(finished_at: Time.now)
  end

end
