class CreateSurveyEvaluations < ActiveRecord::Migration
  def change
    create_table :survey_evaluations do |t|
      t.references :survey_answer, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true

      t.float :value
      t.boolean :autograded
      t.text :manifest

      t.timestamps null: false
    end
  end
end
