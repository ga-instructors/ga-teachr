class CreateSurveyEvaluations < ActiveRecord::Migration
  def change
    create_table :survey_evaluations do |t|
      t.references :survey_answer, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.text :comment

      t.float :value
      t.boolean :autograded, default: false
      t.text :autograde_manifest

      t.timestamps null: false
    end
  end
end
