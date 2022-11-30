Feature: Perform Delete request for User

  Background:
    * url 'https://reqres.in/api'
    * def User =
  """
  {
	"name": "Raghav",
	"job": "QA & Test Automation Engineer"
}

   """

  Scenario: Delete a Single User
    Given path '/users/2'
    And request User
    When method Delete
    Then status 204
    And print response
    And print responseStatus