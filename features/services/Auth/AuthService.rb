class AuthService
  def getPing
    response = HTTParty.get("#{$url}/ping")
    return response
  end

  def authenticateUser(payload)
    response = HTTParty.post("#{$url}/auth", :body => payload)
    return response
  end
end