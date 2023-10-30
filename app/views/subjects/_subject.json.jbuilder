json.extract! subject, :id, :title, :sub_type, :created_at, :updated_at
json.url subject_url(subject, format: :json)
