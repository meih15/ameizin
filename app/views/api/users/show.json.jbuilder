json.user do
  json.extract! @user, :id, :email, :user_name, :created_at, :updated_at
end
