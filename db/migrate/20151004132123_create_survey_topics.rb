class CreateSurveyTopics < ActiveRecord::Migration
  def change
    create_table :survey_topics do |t|
      t.references :survey_question, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
