class CreateStudentRegistrations < ActiveRecord::Migration
  def change
    create_table :student_registrations do |t|
      t.references :student, index: true, foreign_key: true
      t.references :cohort, index: true, foreign_key: true
      t.text :status

      t.timestamps null: false
    end
  end
end
