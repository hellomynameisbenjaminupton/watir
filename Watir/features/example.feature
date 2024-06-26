@example
Feature: Example feature

@test
  Scenario: User can search google
    Given I am viewing google
    When I enter "Benjamin Upton"
    Then The site will be listed - "Benjamin Upton"

@db_test
  Scenario: Database test
    //Given I do something
    //When I call the Database
    //Then I get a result - "db"

@api_test
  Scenario: Database test
    //Given I do something
    //When I call the api
    //Then I get a result - "api"