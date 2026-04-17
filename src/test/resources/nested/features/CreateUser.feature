# classpath:nested/features/CreateUser.feature
@ignore
Feature: Create user

  Scenario: Create a new user
    * url baseURL
    * header Content-Type = 'application/json'
#    * headerader x-api-key = 'reqres-free-v1'

    Given path 'users/add'
    And request { firstName: 'Muhammad',"lastName": 'Ovi' }
    When method POST
    Then status 201
    * def createdUser = response
