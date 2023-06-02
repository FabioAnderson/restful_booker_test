class BookingPayload

  def generateBookingData(checkin, checkout, depositpaid)
    booking_data = {
      firstname: Faker::Name.first_name,
      lastname: Faker::Name.last_name,
      totalprice: rand(100..5000.00).ceil(2),
      depositpaid: depositpaid,
      checkin: checkin.strftime("%Y-%m-%d"),
      checkout: checkout.strftime("%Y-%m-%d"),
      additionalneeds: Faker::Appliance.equipment
    }
    
    return booking_data
  end

  def generateBookingPayload(booking_data)

    {

    "firstname": booking_data[:firstname],

    "lastname": booking_data[:lastname],

    "totalprice": booking_data[:totalprice],

    "depositpaid": booking_data[:depositpaid],

    "bookingdates": {

        "checkin": booking_data[:checkin],

        "checkout": booking_data[:checkout]

    },

    "additionalneeds": booking_data[:additionalneeds]

    }

  end

  def generateBookingPartialPayload(booking_data)

    {

    "firstname": booking_data[:firstname],

    "lastname": booking_data[:lastname],

    }

  end

end