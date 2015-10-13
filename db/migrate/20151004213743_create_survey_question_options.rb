class CreateSurveyQuestionOptions < ActiveRecord::Migration
  def change
    create_table :survey_question_options do |t|
      t.references :survey_question, index: true, foreign_key: true
      t.string :label
      t.float :value, default: 0

      t.timestamps null: false
    end
  end
end
