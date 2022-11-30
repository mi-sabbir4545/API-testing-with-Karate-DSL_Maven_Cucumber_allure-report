Feature: Perform Post request for create User

  Background:
    * url 'https://reqres.in/api'
    * def expectedOutput = read('response1.json')
    * def requestBody = read('request1.json')
    * def User =
  """
  {

  "name": "Raghav",
  "job": "leader"

  }

   """

  Scenario: Create a Single User
    Given path '/users'
    And request User
    When method post
    Then status 201
    And print response
    And print responseStatus

  Scenario: Create a Single User with assertion
    Given path '/users'
    And request User
    When method post
    Then status 201
    And print response
    And print responseStatus
    And match response.name == 'Raghav'
    And match response == {"name": "Raghav","job": "leader","id": "#string","createdAt": "#ignore"}

  Scenario: Post with read response from file
    Given path '/users'
    And request User
    When method post
    Then status 201
    And match response == expectedOutput
    And print response

  Scenario: Post with read request from file
    Given path '/users'
    And request requestBody
    When method post
    Then status 201
    And print response
    And print responseStatus
