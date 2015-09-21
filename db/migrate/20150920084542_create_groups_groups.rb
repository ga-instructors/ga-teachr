class CreateGroupsGroups < ActiveRecord::Migration
  def change
    create_table :groups_groups do |t|
      t.references :groups_grouping, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
