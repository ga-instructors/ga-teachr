module Survey
  class Answer < ActiveRecord::Base
    belongs_to :question, foreign_key: :survey_question_id, touch: true
    belongs_to :response, foreign_key: :survey_response_id, touch: true
    belongs_to :student, touch: true
    belongs_to :question_option, class_name: Question::Option, foreign_key: :survey_question_option_id

    has_many :evaluations, foreign_key: :survey_answer_id, dependent: :destroy

    def answer_html
      if self[:answer].blank? then return nil
      elsif question.format == "" then markdown = self[:answer]
      else markdown = ["```#{question.format}", answer, "```"].join("\n")
      end
      Redcarpet::Markdown.new(MarkdownPygments.new({
        escape_html: true
      }), {
        fenced_code_blocks: true
      }).render(markdown).html_safe
    end

  end
end
