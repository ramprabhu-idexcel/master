json.extract! message, :id, :comment, :created_at, :updated_at
json.url message_url(message, format: :json)