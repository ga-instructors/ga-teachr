class CreateCohortFunctions < ActiveRecord::Migration
  def change
    create_table :cohort_functions do |t|
      t.string :type
      t.references :cohort, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
