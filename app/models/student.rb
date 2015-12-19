class Student < ActiveRecord::Base
  belongs_to :cohort

  has_one :user
  accepts_nested_attributes_for :user
  validates :first_name, :email, presence: true

  has_many :registrations
  has_many :cohorts, through: :registrations
  belongs_to :cohort

  has_many :survey_responses, class_name: 'Survey::Response'
  scope :by_quiz_performance, -> {
    eager_load(:survey_responses => [{:answers => :evaluations}, :questionnaire])
    .where("survey_questionnaires.type = 'Survey::Quiz'")
    .order('survey_evaluations.value')
  }

  validates :cohort, presence: true

  delegate :campus, to: :cohort

  after_initialize do
    build_user if user.blank? && new_record?
  end

  def name
    [first_name, last_name].join(' ')
  end

end
