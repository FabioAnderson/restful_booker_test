Before do |scn|
  @health_service = HealthService.new
  @health_validator = HealthValidator.new
  @auth_service = AuthService.new
  @auth_validator = AuthValidator.new
  @auth_payload = AuthPayload.new
  @booking_service = BookingService.new
  @booking_validator = BookingValidator.new
  @booking_payload = BookingPayload.new


  @response = nil
  @first_booking = nil
  @second_booking = nil
  @payload = nil
  @booking_data = nil
  booking_response = nil
  @token = nil
end