
Feature: Get the details of user 3

Background:Set url
    * url 'https://reqres.in/api/'

Scenario: Get the details of user 3
    Given path 'users/3'
    When method get
    Then status 200

Scenario:Create an user
    * def user =
    """
        {
            "name": "morpheus",
            "job": "leader"
        }
    """
    Given path 'users'
    And request user
    When method post 
    Then status 201

Scenario: Create another user
    * def user2 =
    """
        {
            "name": "Johnny Sins",
            "job": "Porn star"
        }
    """
    Given path 'users'
    And request user2
    When method post 
    Then status 201
    Then match response == "#object"
    Then match response.name == "Johnny Sins"

Scenario: Get User details of id 2
    Given path 'users/'
    And param page = 2
    When method get
    Then status 200
    Then match response == "#object"
    Then match response.page == 2
