json.array!(@employees) do |employee|
  json.extract! employee, :id, :first_name, :last_name, :title, :email, :campus_id, :debug, :admin, :password_digest
  json.url employee_url(employee, format: :json)
end
