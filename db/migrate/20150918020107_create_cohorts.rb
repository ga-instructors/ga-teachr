class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.references :campus, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.string :name
      t.string :github_repo
      t.timestamp :begins_at
      t.timestamp :ends_at

      t.float :banner_x
      t.float :banner_y

      t.timestamps null: false
    end
  end
end
