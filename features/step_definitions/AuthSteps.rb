Given('the user has a valid username and password') do
  @payload = @auth_payload.generateAuthPayload(DATA['validUser'])
end

When('make a request to authenticate the user') do
  @response = @auth_service.authenticateUser(@payload)
end

Then('the API will return an authentication token with a 200 response') do
  @token = @auth_validator.validateAuthentication(@response)
end

Given ('the user does not have a valid username and password') do
  @payload = @auth_payload.generateAuthPayload(DATA['invalidUser'])
end

Then ('the API will return an error message with a 200 response') do
  @token = @auth_validator.validateAuthenticationError(@response)
end