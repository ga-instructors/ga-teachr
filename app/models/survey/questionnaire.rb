class Survey::Questionnaire < ActiveRecord::Base
  belongs_to :cohort
  after_initialize :ordinal

  def ordinal
    self[:ordinal] ||= cohort ? (cohort.surveys.maximum(:ordinal) || 0) + 1 : nil
  end

  def introduction_html
    Redcarpet::Markdown.new(MarkdownPygments, {
      fenced_code_blocks: true,
      tables: true,
      no_intra_emphasis: true
    }).render(self[:introduction]).html_safe
  end

end
