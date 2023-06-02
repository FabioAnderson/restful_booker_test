#language: en

Feature: System Health Check

  @health
  Scenario: Check if the API is running
    Given user makes a request for the API health check
    Then the API shall return an health status message with a 201 response