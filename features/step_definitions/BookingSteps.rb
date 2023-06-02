Given('the user has the booking information with the deposit already paid') do
  @booking_data = @booking_payload.generateBookingData(Faker::Date.forward(days: 7), Faker::Date.forward(days: 14), true)
  @payload = @booking_payload.generateBookingPayload(@booking_data)
end

When('make a request to create a new booking') do
  @response = @booking_service.createBooking(@payload)
end

Then('the API should respond with details of the booking and a 200 status code') do
  @booking_validator.validateBooking(@response,  @booking_data)
end

Given('the user has the booking information without paying the deposit') do
  @booking_data = @booking_payload.generateBookingData(Faker::Date.forward(days: 7), Faker::Date.forward(days: 14), false)
  @payload = @booking_payload.generateBookingPayload(@booking_data)
end

Given ('the user makes a request to list all booking ids')do
  @response = @booking_service.getBookingIds(nil)
end

Then ('the API should return a list of booking ids and a 200 response') do
  @booking_validator.validateBookingIdsList(@response, @first_booking, @second_booking)
end

Given ('the user has an existing booking') do
  step 'the user has the booking information with the deposit already paid'
  @booking_response = step 'make a request to create a new booking'
end

When ('the user has made a request to list booking ids, filtering by name and lastname') do
  @response = @booking_service.getBookingIds("?firstname=#{@booking_response['booking']['firstname']}"+
                                              "&lastname=#{@booking_response['booking']['lastname']}")
  
end

When ('the user has made a request to list booking ids, filtering by date') do
  @response = @booking_service.getBookingIds("?checkin=#{@booking_response['booking']['bookingdates']['checkin']}"+
                                              "&checkout=#{@booking_response['booking']['bookingdates']['checkout']}")
  
end

And ('creates another booking for the same user') do
  @first_booking = @response
  second_booking_data = @booking_payload.generateBookingData(Faker::Date.forward(days: 18), Faker::Date.forward(days: 25), true)
  second_booking_data[:firstname] = @booking_data[:firstname]
  second_booking_data[:lastname] = @booking_data[:lastname]
  second_payload = @booking_payload.generateBookingPayload(second_booking_data)
  @second_booking = @booking_service.createBooking(second_payload)
end

When ('make a request to get booking details') do
  @response = @booking_service.getBookingDetail(@booking_response['bookingid'])
end

Then ('the API should respond with details matching the existing booking and a 200 status code') do
  @booking_validator.validateBookingDetails(@response,  @booking_data)
end

And ("the user is authenticated") do
  step 'the user has a valid username and password'
  step 'make a request to authenticate the user'
  @token = step 'the API will return an authentication token with a 200 response'
end

When ('make a request to update booking information') do
  @booking_data = @booking_payload.generateBookingData(Faker::Date.forward(days: 30), Faker::Date.forward(days: 35), true)
  @payload = @booking_payload.generateBookingPayload(@booking_data)
  @response = @booking_service.updateBooking(@booking_response['bookingid'], @token, @payload)
end

Then ('the API should respond with details matching the new booking data and a 200 status code') do
  step 'the API should respond with details matching the existing booking and a 200 status code'
end

When ('make a request to update some of booking information') do
  @booking_data[:first_name] = Faker::Name.first_name
  @booking_data[:last_name] = Faker::Name.last_name
  @payload = @booking_payload.generateBookingPartialPayload(@booking_data)
  @response = @booking_service.partialUpdateBooking(@booking_response['bookingid'], @token, @payload)
end

When ('make a request to delete this booking') do
  @response = @booking_service.deleteBooking(@booking_response['bookingid'], @token)
end

Then ('the API should delete the booking and respond with 201 status code') do
  @booking_validator.validateDeletedBooking(@response)
end

And ('the user is not authenticated') do
  step 'the user does not have a valid username and password'
  step 'make a request to authenticate the user'
  @token = step 'the API will return an error message with a 200 response'
end

Then ('the API should respond with forbidden 403 status code') do
  @booking_validator.validateForbiddenResult(@response)
end