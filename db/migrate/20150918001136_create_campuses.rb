class CreateCampuses < ActiveRecord::Migration
  def change
    create_table :campuses do |t|
      t.string :name
      t.string :timezone
      t.string :locale
      t.float :address_latitude
      t.float :address_longitude
      t.string :address_street
      t.string :address_city
      t.string :address_state
      t.string :address_country
      t.string :address_code
      t.string :phone_number
      t.text :description

      t.timestamps null: false
    end
  end
end
