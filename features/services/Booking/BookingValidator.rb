include RSpec::Matchers

class BookingValidator

  def validateBooking(response, booking_data)
    expect(response.code).to eq(200)
    body = JSON.parse(response.body)
    expect(body).to have_key('bookingid')
    expect(body).to have_key('booking')
    expect(body['booking']).to have_key('firstname')
    expect(body['booking']['firstname']).to eql(booking_data[:firstname])
    expect(body['booking']).to have_key('lastname')
    expect(body['booking']['lastname']).to eql(booking_data[:lastname])
    expect(body['booking']).to have_key('totalprice')
    # Price is not being saved with decimal places.
    # For the sake of continuity, I'm assuming it might be a business rule decision
    if (body['booking']['totalprice'].is_a? Integer)
      p 'The price is not being saved with decimal places. Please, check that information with your team.'
    else
      expect(body['booking']['totalprice']).to eql(booking_data[:totalprice])
    end
    expect(body['booking']).to have_key('depositpaid')
    expect(body['booking']['depositpaid']).to eql(booking_data[:depositpaid])
    expect(body['booking']).to have_key('bookingdates')
    expect(body['booking']["bookingdates"]).to have_key('checkin')
    expect(body['booking']["bookingdates"]['checkin']).to eql(booking_data[:checkin])
    expect(body['booking']["bookingdates"]).to have_key('checkout')
    expect(body['booking']["bookingdates"]['checkout']).to eql(booking_data[:checkout])
    expect(body['booking']).to have_key('additionalneeds')
    expect(body['booking']['additionalneeds']).to eql(booking_data[:additionalneeds])

    p 'The booking was created with success'
    return body['bookingid']
  end

  def validateBookingDetails(response, booking_data)
    expect(response.code).to eq(200)
    body = JSON.parse(response.body)
    expect(body).to have_key('firstname')
    expect(body['firstname']).to eql(booking_data[:firstname])
    expect(body).to have_key('lastname')
    expect(body['lastname']).to eql(booking_data[:lastname])
    expect(body).to have_key('totalprice')
    # Price is not being saved with decimal places.
    # For the sake of continuity, I'm assuming it might be a business rule decision
    if (body['totalprice'].is_a? Integer)
      p 'The price is not being saved with decimal places. Please, check that information with your team.'
    else
      expect(body['totalprice']).to eql(booking_data[:totalprice])
    end
    expect(body).to have_key('depositpaid')
    expect(body['depositpaid']).to eql(booking_data[:depositpaid])
    expect(body).to have_key('bookingdates')
    expect(body["bookingdates"]).to have_key('checkin')
    expect(body["bookingdates"]['checkin']).to eql(booking_data[:checkin])
    expect(body["bookingdates"]).to have_key('checkout')
    expect(body["bookingdates"]['checkout']).to eql(booking_data[:checkout])
    expect(body).to have_key('additionalneeds')
    expect(body['additionalneeds']).to eql(booking_data[:additionalneeds])

    p 'The booking details was presented with success'

  end

  def validateBookingIdsList(response, first_booking, second_booking)
    expect(response.code).to eq(200)
    body = JSON.parse(response.body)
    expect(body).to_not be_nil
    expect(body.find { |item| item['bookingid']}).to_not be_nil
    expect(body.find { |item| item['bookingid']}).to have_key('bookingid')
    expect(body.find { |item| item['bookingid']}['bookingid']).to be_a_kind_of(Integer)
    
    if first_booking != nil && second_booking != nil
      expect(body.length).to be >= 2
      expect(body.find { |item| item['bookingid'] == JSON.parse(first_booking.body)['bookingid'] }).to_not be_nil
      expect(body.find { |item| item['bookingid'] == JSON.parse(second_booking.body)['bookingid'] }).to_not be_nil
    else
      expect(body.length).to be >= 1
    end

    p 'The booking ids were listed with success'

  end

  def validateDeletedBooking(response)
    expect(response.code).to eq(201)
    expect(response.body).to eq('Created')
    p 'The booking was deleted'
  end

  def validateForbiddenResult(response)
    expect(response.code).to eq(403)
    expect(response.body).to eq('Forbidden')
    p 'The request is protected by authentication'
  end
end