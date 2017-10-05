json.extract! user, :id, :name, :money, :created_at, :updated_at
json.url user_url(user, format: :json)
