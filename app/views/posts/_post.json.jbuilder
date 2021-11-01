json.extract! post, :id, :body, :allow, :created_at, :updated_at
json.url post_url(post, format: :json)
