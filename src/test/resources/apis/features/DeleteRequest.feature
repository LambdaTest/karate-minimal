@DeleteRequest
Feature: Delete user in DB

  Background:
    * url baseURL
    * header Accept = 'application/json'
#    * header x-api-key = 'reqres-free-v1'

  @UpdateUser
  Scenario: Delete Existing User
    Given path 'users/1'
    When method DELETE
    Then status 200
    And print response
    And match response.isDeleted == true

