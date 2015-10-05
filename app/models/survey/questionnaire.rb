class Survey::Questionnaire < ActiveRecord::Base
  after_initialize :initialize_ordinal
  before_save :update_ordinals

  default_scope { order(:ordinal) }

  belongs_to :cohort
  has_many :questions, foreign_key: 'survey_questionnaire_id'
  has_many :responses, foreign_key: 'survey_questionnaire_id'

  def initialize_ordinal
    self.ordinal ||= cohort ? (cohort.surveys.maximum(:ordinal) || 0) + 1 : nil
  end

  def introduction_html
    Redcarpet::Markdown.new(MarkdownPygments, {
      fenced_code_blocks: true,
      tables: true,
      no_intra_emphasis: true
    }).render(self[:introduction]).html_safe
  end

  def update_ordinals
    cohort.surveys.where('ordinal >= ? AND id != ?', ordinal, id).order(:ordinal).each_with_index do |survey, i|
      next_ordinal = i + ordinal + 1
      break if survey.ordinal > next_ordinal
      survey.update_column('ordinal', next_ordinal)
    end
  end

end
