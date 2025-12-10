# classpath:nested/features/CreateUser.feature
@ignore
Feature: Create user

  Scenario: Create a new user
    * url baseURL
    * header Accept = 'application/json'
    * header x-api-key = 'reqres-free-v1'

    Given path 'api/users'
    And request { name: 'morpheus', job: 'leader' }
    When method POST
    # Then status 201
    * def createdUser = response
