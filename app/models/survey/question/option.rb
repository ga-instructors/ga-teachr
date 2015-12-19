class Survey::Question::Option < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper
  belongs_to :survey_question
  has_many :answers, class_name: 'Survey::Answer', foreign_key: :survey_question_option_id, dependent: :destroy

  def label_html
    return nil if label.blank?
    sanitize(Redcarpet::Markdown.new(MarkdownPygments, {
      fenced_code_blocks: false,
      tables: false,
      no_intra_emphasis: true,
      lax_spacing: true
    }).render(self[:label]), tags: %w{strong em code})

    # .html_safe
  end
end
