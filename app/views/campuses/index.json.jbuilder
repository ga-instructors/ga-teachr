json.array!(@campuses) do |campus|
  json.extract! campus, :id, :name, :timezone, :language, :latitude, :longitude, :address_street, :address_city, :address_state, :address_zip, :phone_number, :description
  json.url campus_url(campus, format: :json)
end
