json.array!(@users) do |user|
  json.extract! user, :id, :name, :photo
  json.url user_url(user, format: :json)
end
