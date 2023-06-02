Given('user makes a request for the API health check') do
  @response = @health_service.getPing
end

Then ('the API shall return an health status message with a 201 response') do
  @health_validator.validatePing(@response)
end
