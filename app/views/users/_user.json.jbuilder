json.extract! user, :id, :name, :email, :password, :institution, :registration_number, :nickname, :age, :created_at, :updated_at
json.url user_url(user, format: :json)
