class CreateSurveyQuestionnaires < ActiveRecord::Migration
  def change
    create_table :survey_questionnaires do |t|
      t.references :cohort, index: true, foreign_key: true
      t.integer :ordinal
      t.string :title
      t.text :introduction

      t.timestamps null: false
    end
  end
end
