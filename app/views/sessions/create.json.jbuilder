if @user
  json.id @user.id
  json.username @user.username
  json.loggedIn true
end
