include RSpec::Matchers

class AuthValidator
  
  def validatePing(response)
    expect(response.code).to eq(201)
    expect(response.body).to eq('Created')
    p 'The API is running'
  end

  def validateAuthentication(response)
    expect(response.code).to eq(200)
    body = JSON.parse(response.body)
    expect(body).to have_key('token')
    expect(body['token']).not_to be_empty
    expect(body['token']).to be_an_instance_of(String)

    return body['token']
  end

  def validateAuthenticationError(response)
    expect(response.code).to eq(200)
    body = JSON.parse(response.body)
    expect(body).to have_key('reason')
    expect(body['reason']).not_to be_empty
    expect(body['reason']).to be_an_instance_of(String)
    
    return body['reason']
  end

end