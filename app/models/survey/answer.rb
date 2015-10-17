module Survey
  class Answer < ActiveRecord::Base
    belongs_to :question, foreign_key: :survey_question_id
    belongs_to :response, foreign_key: :survey_response_id
    belongs_to :student
    belongs_to :question_option, class_name: Question::Option, foreign_key: :survey_question_option_id

    has_many :evaluations, foreign_key: :survey_answer_id, dependent: :destroy

    def answer_html
      return nil if self[:answer].blank?
      markdown = if question.format.nil? then self[:answer]
      else ["```#{question.format}", answer, "```"].join("\n")
      end
      Redcarpet::Markdown.new(MarkdownPygments, {
        fenced_code_blocks: true,
        tables: true,
        no_intra_emphasis: true
      }).render(markdown).html_safe
    end

  end
end
