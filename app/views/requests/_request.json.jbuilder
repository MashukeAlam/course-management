json.extract! request, :id, :role, :user_id, :created_at, :updated_at
json.url request_url(request, format: :json)
