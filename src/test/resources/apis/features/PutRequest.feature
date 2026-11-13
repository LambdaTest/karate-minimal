@PutRequest
Feature: Update user in DB

  Background:
    * url baseURL
    * header Accept = 'application/json'

  @UpdateUser
  Scenario: Update Existing User
    Given path 'users/2'
    And request {"firstName": "morpheus", "city": "Florida"}
    When method PUT
    Then status 200
    And print response

