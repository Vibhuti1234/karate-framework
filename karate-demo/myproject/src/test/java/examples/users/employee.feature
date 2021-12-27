Feature: Employee management system test

Background:set url
    * url 'http://localhost:8080/code'


Scenario:Test and verify all the operations
    * def newEmployee =
    """
        {
            "id": 6,
            "name": "Parag"
    
        }
    """
    Given path '/save'
    And request newEmployee
    When method post
    Then status 201
    Then match response == "#object"
    Then match response.id == 6
    Then match response.name == "Parag"

    * def empId = 5
     
    Given path '/emp/'+empId
    When method get
    Then status 200
    Then match response == "#object"
    Then match response.id == 5
    Then match response.name == "Johnny"

    * def updatedEmployee =
    """
        {
            "id": 3,
            "name": "Dean"
    
        }
    """
        Given path '/update'
        And request updatedEmployee
        When method put
        Then status 201
        Then match response == "#object"
        Then match response.id == 3
        Then match response.name == "Dean"

    # * def delEmpId = 10
       
    # Given path '/delete/'+delEmpId
    # When method delete
    # Then status 202

    Given path '/all'
    When method get
    Then status 200
    Then match response[*].id contains [1,2,3,4,5,6,11]
    Then match response[*].name !contains ["Mia Khalifa","Mia Malkova"]
    Then match response[*].name contains ["Vibhuti","Gaurav","Dean","Pankaj"]
    Then match response[*].name contains "Vibhuti"
    Then match response[*].name !contains "Victor Bario"



    





