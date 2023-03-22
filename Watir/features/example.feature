@rb_example
Feature: RB Example feature

  Scenario: User can search google
    Given I am viewing google
    When I enter "GitHub"
    Then The site will be listed - "git"