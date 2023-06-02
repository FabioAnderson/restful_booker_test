class HealthService

  def getPing
    response = HTTParty.get("#{$url}/ping")
    return response
  end
  
end