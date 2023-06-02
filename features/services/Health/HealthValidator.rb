include RSpec::Matchers

class HealthValidator
  
  def validatePing(response)
    expect(response.code).to eq(201)
    expect(response.body).to eq('Created')
    p "The API is running"
  end

end