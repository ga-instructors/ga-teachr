class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email, unique: true, index: true
      t.references :campus, index: true, foreign_key: true
      t.boolean :debug
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
