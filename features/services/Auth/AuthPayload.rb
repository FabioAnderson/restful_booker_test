class AuthPayload
  def generateAuthPayload(user)
    {
    "username": "#{user['username']}",
    "password": "#{user['password']}"
    }
  end
end