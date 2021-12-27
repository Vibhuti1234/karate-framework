Feature: Graphql api testing
Background:Set Url
    * url 'https://api.graphql.jobs'

Scenario:Test graphql jobs api
    * text queryStatement =
    """
        query{
            jobs{
              id,title
            }
          }
          
          
    """
    Given path '/'
    And request { query: '#(queryStatement)' }
    And header Accept = 'application/json'
    When method post
    Then status 200
    Then match response.data.jobs[*].id contains ["cjv3yh41501bi07277e6fa0fr","cjv2qu4sl05b707331hnug02o"]
    Then match response.data.jobs[*].title contains ["Senior Software Developer","Senior Product Engineer", "Front-End Intern"]