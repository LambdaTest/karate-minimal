# classpath:nested/features/Main.feature
Feature: Create and then get a user

  Scenario: Reuse create and get user
    * def result = call read('classpath:nested/features/CreateUser.feature')
    * print 'Created User:', result.createdUser
    * def userId = result.createdUser.id

    * def getResult = call read('classpath:nested/features/GetUser.feature') { id: userId }
    * print 'Fetched User Info:', getResult.userInfo
