json.array!(@authentications) do |authentication|
  json.extract! authentication, :id, :type, :user_id, :password
  json.url authentication_url(authentication, format: :json)
end
