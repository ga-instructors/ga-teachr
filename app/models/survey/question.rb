class Survey::Question < ActiveRecord::Base
  FORMATS = [
    ["Plain Text (Monospace)", :text],
    ["Plain Text (Markdown)", ""],
    ["HTML", :html],
    ["CSS", :css],
    ["JavaScript", :javascript],
    ["Ruby", :ruby],
    ["SQL", :sql],
    ["CoffeeScript", :coffeescript],
    ["Bash/Shell", :bash],
    ["JSON", :json]
  ]

  default_scope -> { order(:ordinal) }

  belongs_to :questionnaire, foreign_key: :survey_questionnaire_id, touch: true
  has_many :options, foreign_key: :survey_question_id
  has_many :topics, foreign_key: :survey_question_id
  accepts_nested_attributes_for :topics
  accepts_nested_attributes_for :options, reject_if: proc { |attrs| attrs["label"].blank? }, allow_destroy: true
  has_many :answers, foreign_key: :survey_question_id

  after_initialize :initialize_ordinal
  before_save :update_ordinals

  def prompt_html
    return nil if self[:prompt].blank?
    Redcarpet::Markdown.new(MarkdownPygments.new({
      escape_html: true
    }), {
      fenced_code_blocks: true
    }).render(self[:prompt]).html_safe
  end

  def multiple_choice
    new_record? || options.find(&:persisted?)
  end

  def multple_choice=(multiple_choice)
    options.each(&:mark_for_destruction) if multiple_choice == "0"
  end

  def build_initial_options
    if new_record? && questionnaire.is_a?(Survey::ExitTicket)
      (1..10).each do |value|
        options.build(label: value, value: value)
      end
    end
    options.build
  end

  private

  def initialize_ordinal
    self.ordinal ||= questionnaire ? (questionnaire.questions.maximum(:ordinal) || 0) + 1 : nil
  end

  # TODO: Will update other quizzes so the ordinals are sequential
  def update_ordinals
    questionnaire.questions.where('ordinal >= ? AND id != ?', ordinal, id).order(:ordinal).each_with_index do |question, i|
      next_ordinal = i + ordinal + 1
      break if question.ordinal > next_ordinal
      question.update_column('ordinal', next_ordinal)
    end
  end

end
