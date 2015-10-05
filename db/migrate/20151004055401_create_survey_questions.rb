class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|
      t.references :survey_questionnaire, index: true, foreign_key: true
      t.integer :ordinal
      t.text :prompt
      t.boolean :open_ended
      t.string :format
      t.text :valuation

      t.timestamps null: false
    end
  end
end
