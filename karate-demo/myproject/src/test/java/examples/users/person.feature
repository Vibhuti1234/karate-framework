
Feature: Get the details of person 2

Background:Set url
    * url 'https://reqres.in/api/'

Scenario: Get the details of person 2
    Given path 'users/2'
    When method get
    Then status 200

Scenario:Create a person
    * def user =
    """
        {
            "name": "morphy",
            "job": "fucker"
        }
    """
    Given path 'users'
    And request user
    When method post 
    Then status 201

