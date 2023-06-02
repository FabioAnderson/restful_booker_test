class BookingService
  
  def createBooking(payload)
    response = HTTParty.post("#{$url}/booking", :body => payload)
    return response
  end

  def getBookingIds(query_params)
    response = HTTParty.get("#{$url}/booking#{query_params}")
    return response
  end

  def getBookingDetail(booking_id)
    response = HTTParty.get("#{$url}/booking/#{booking_id}")
    return response
  end

  def updateBooking(booking_id, token, payload)
    response = HTTParty.put("#{$url}/booking/#{booking_id}", :headers => { Cookie: "token=#{token}"}, :body => payload)
    return response
  end

  def partialUpdateBooking(booking_id, token, payload)
    response = HTTParty.patch("#{$url}/booking/#{booking_id}", :headers => { Cookie: "token=#{token}"}, :body => payload)
    return response
  end

  def deleteBooking(booking_id, token)
    response = HTTParty.delete("#{$url}/booking/#{booking_id}", :headers => { Cookie: "token=#{token}"})
    return response
  end

end