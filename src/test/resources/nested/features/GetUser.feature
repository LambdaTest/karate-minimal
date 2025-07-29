# classpath:nested/features/GetUser.feature
@ignore
Feature: Get user

  Scenario: Get user by ID
    * def userId = __arg.id
    * url baseURL
    * header Accept = 'application/json'
    * header x-api-key = 'reqres-free-v1'

    Given path 'api/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    * def userlist = response
