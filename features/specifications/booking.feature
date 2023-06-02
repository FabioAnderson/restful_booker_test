#language: en

Feature: Booking Management

  @booking @create_booking
  Scenario: Create a new booking paying the deposit
    Given the user has the booking information with the deposit already paid
    When make a request to create a new booking
    Then the API should respond with details of the booking and a 200 status code

  @booking @create_booking
  Scenario: Create a new booking without paying the deposit
    Given the user has the booking information without paying the deposit
    When make a request to create a new booking
    Then the API should respond with details of the booking and a 200 status code

  @booking @list_booking_ids
  Scenario: List all booking ids
    Given the user makes a request to list all booking ids
    Then the API should return a list of booking ids and a 200 response

  @booking @list_booking_ids @list_booking_ids_by_name
  Scenario: List booking ids filtering by name
    Given the user has an existing booking
    When the user has made a request to list booking ids, filtering by name and lastname
    Then the API should return a list of booking ids and a 200 response

  @booking @list_booking_ids @list_booking_ids_by_date
  Scenario: List booking ids filtering by date
    Given the user has an existing booking
    When the user has made a request to list booking ids, filtering by date
    Then the API should return a list of booking ids and a 200 response

  @booking @create_two_bookings @list_booking_ids_by_name
  Scenario: Create two bookings for the same user
    Given the user has an existing booking
    And creates another booking for the same user
    When the user has made a request to list booking ids, filtering by name and lastname
    Then the API should return a list of booking ids and a 200 response

  @booking @get_booking_detail
  Scenario: Get booking
    Given the user has an existing booking
    When make a request to get booking details
    Then the API should respond with details matching the existing booking and a 200 status code

  @booking @update_booking
  Scenario: Update booking
    Given the user has an existing booking
    And the user is authenticated
    When make a request to update booking information
    Then the API should respond with details matching the new booking data and a 200 status code

  @booking @partial_update_booking
  Scenario: Partial update booking
    Given the user has an existing booking
    And the user is authenticated
    When make a request to update some of booking information
    Then the API should respond with details matching the new booking data and a 200 status code

  @booking @delete_booking
  Scenario: Delete booking
    Given the user has an existing booking
    And the user is authenticated
    When make a request to delete this booking
    Then the API should delete the booking and respond with 201 status code

  @booking @unauthenticated_update_booking
  Scenario: Unauthenticated update booking
    Given the user has an existing booking
    And the user is not authenticated
    When make a request to update booking information
    Then the API should respond with forbidden 403 status code

  @booking @unauthenticated_partial_update_booking
  Scenario: Unauthenticated partial update booking
    Given the user has an existing booking
    And the user is not authenticated
    When make a request to update some of booking information
    Then the API should respond with forbidden 403 status code

  @booking @unauthenticated_delete_booking
  Scenario: Unauthenticated delete booking
    Given the user has an existing booking
    And the user is not authenticated
    When make a request to delete this booking
    Then the API should respond with forbidden 403 status code

