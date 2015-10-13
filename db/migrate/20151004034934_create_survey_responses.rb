class CreateSurveyResponses < ActiveRecord::Migration
  def change
    create_table :survey_responses do |t|
      t.references :survey_questionnaire, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamp :finished_at
      t.timestamps null: false
    end
  end
end
