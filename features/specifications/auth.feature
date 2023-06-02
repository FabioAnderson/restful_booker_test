#language: en

Feature: User Authentication

  @auth @valid_authentication
  Scenario: Valid user authentication
    Given the user has a valid username and password
    When make a request to authenticate the user
    Then the API will return an authentication token with a 200 response

  @auth @invalid_authentication
  Scenario: Invalid user authentication
    Given the user does not have a valid username and password
    When make a request to authenticate the user
    Then the API will return an error message with a 200 response
