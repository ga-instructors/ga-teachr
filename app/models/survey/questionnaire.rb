class Survey::Questionnaire < ActiveRecord::Base
  after_initialize :initialize_ordinal
  before_save :update_ordinals

  # Primary Scopes
  default_scope { order :ordinal }
  scope :ready, -> { available.eager_load(:responses).where('survey_responses.id IS NULL') }

  # Secondary Scopes
  scope :available, -> { joins(:cohort).where(<<-SQL, *[Time.now.utc]*4) }
        ((survey_questionnaires.begins_at IS NULL AND cohorts.begins_at < ?) OR cohorts.begins_at < ?)
    AND ((survey_questionnaires.ends_at   IS NULL AND cohorts.ends_at   > ?) OR cohorts.ends_at   > ?)
  SQL

  # Associations
  belongs_to :cohort
  has_many :questions, foreign_key: :survey_questionnaire_id
  has_many :responses, foreign_key: :survey_questionnaire_id
  has_many :evaluations, foreign_key: :survey_questionnaire_id

  # Validations
  validates :ordinal, :title, presence: true

  # Methods
  def initialize_ordinal
    self.ordinal ||= cohort ? (self.class.where(cohort: cohort).maximum(:ordinal) || 0) + 1 : nil
  end

  def introduction_html
    return if self[:introduction].nil?
    Redcarpet::Markdown.new(MarkdownPygments, {
      fenced_code_blocks: true,
      tables: true,
      no_intra_emphasis: true
    }).render(self[:introduction]).html_safe
  end

  def update_ordinals
    self.class.where(cohort: cohort).where('ordinal >= ? AND id != ?', ordinal, id).order(:ordinal).each_with_index do |survey, i|
      next_ordinal = i + ordinal + 1
      break if survey.ordinal > next_ordinal
      survey.update_column('ordinal', next_ordinal)
    end
  end

end
