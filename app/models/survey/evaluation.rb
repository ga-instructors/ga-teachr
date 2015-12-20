class Survey::Evaluation < ActiveRecord::Base
  belongs_to :survey_answer, class_name: 'Survey::Answer'
  belongs_to :student
  belongs_to :employee

  def comment_html
    return nil if self[:comment].blank?
    Redcarpet::Markdown.new(MarkdownPygments.new({
      escape_html: true
    }), {
      fenced_code_blocks: true
    }).render(self[:comment]).html_safe
  end

end
