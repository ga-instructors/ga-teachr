class CreateSurveyQuestionnaires < ActiveRecord::Migration
  def change
    create_table :survey_questionnaires do |t|
      t.string :type
      t.references :cohort, index: true, foreign_key: true
      t.integer :ordinal
      t.string :title
      t.timestamp :begins_at
      t.timestamp :ends_at
      t.text :introduction
      t.boolean :open_book

      t.timestamps null: false
    end
  end
end
