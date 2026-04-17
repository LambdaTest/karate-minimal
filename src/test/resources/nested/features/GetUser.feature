# classpath:nested/features/GetUser.feature
@ignore
Feature: Get user

  Scenario: Get user by ID
    * def userId = __arg.id
    * url baseURL
    * header Content-Type = 'application/json'
#    * header x-api-keykey = 'reqres-free-v1'

    Given path 'user'
    And param sortBy = 'firstName'
    When method GET
    Then status 200
    And print response
    * def userlist = response
