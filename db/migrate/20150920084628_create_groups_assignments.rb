class CreateGroupsAssignments < ActiveRecord::Migration
  def change
    create_table :groups_assignments do |t|
      t.references :groups_group, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
