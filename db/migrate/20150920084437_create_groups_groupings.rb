class CreateGroupsGroupings < ActiveRecord::Migration
  def change
    create_table :groups_groupings do |t|
      t.references :cohort, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
