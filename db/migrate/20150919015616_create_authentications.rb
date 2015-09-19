class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :type
      t.references :user, index: true, foreign_key: true
      t.string :token, index: true
      t.string :ip_address
      t.string :user_agent
      t.string :accept_language
      t.string :ipinfo_hostname
      t.string :ipinfo_city
      t.string :ipinfo_region
      t.string :ipinfo_country
      t.string :ipinfo_org
      t.string :ipinfo_postal
      t.string :ipinfo_phone
      t.float  :ipinfo_latitude
      t.float  :ipinfo_longitude

      t.timestamps null: false
    end
  end
end
