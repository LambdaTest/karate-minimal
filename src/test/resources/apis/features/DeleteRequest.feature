@DeleteRequest
Feature: Delete user in DB

  Background:
    * url baseURL
    * header Accept = 'application/json'

  @UpdateUser
  Scenario: Delete Existing User
    Given path 'users/1'
    When method DELETE
    Then status 204
