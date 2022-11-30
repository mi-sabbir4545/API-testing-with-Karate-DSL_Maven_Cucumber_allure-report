Feature: Perform Put request for Update User

  Background:
    * url 'https://reqres.in/api'
    * def User =
  """
  {
	"name": "Raghav",
	"job": "QA & Test Automation Engineer"
}

   """

  Scenario: Update a Single User
    Given path '/users/2'
    And request User
    When method PUT
    Then status 200
    And print response
    And print responseStatus