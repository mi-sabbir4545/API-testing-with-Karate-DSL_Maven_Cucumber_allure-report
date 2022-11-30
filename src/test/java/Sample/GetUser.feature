Feature: Perform GET request

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'


  Scenario: Perform get request for List User
    Given url 'https://reqres.in/api/users?page=2'
    When method Get
    Then status 200
    And print response.data
    And print response.data[4]
    And match response.data[0].first_name != null
    And match $.data[3].id == 10
    And match response.data[4].last_name == 'Edwards'
    And match response.page == 2
    And match response.per_page == 6
    And assert response.data.length == 6


  Scenario: Get API with background
    Given path '/users?page=2'
    When method GET
    Then status 200
    * print response.data[3]

  Scenario: Get API with background but with path and param separated
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print responseHeaders
    And print responseTime
    And print responseStatus
    And print responseCookies


  Scenario: Get API with getting a specified attribute
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response.data[0].name
    And print response.data[0].year

  Scenario: Get API with single user
    Given path '/users/2'
    When method  GET
    Then status 200
    And  print response.data


