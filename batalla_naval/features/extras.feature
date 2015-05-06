Feature: Extras

  Background:
    Given a board with dimensions "5" x "5"


  Scenario: Create a large ship in a invalid location
    Given I create a large ship in position "3" :"5"
    Then it will raise an error "location is out of board"

  Scenario: Shooting in a invalid location
    Given I shoot to position "3" :"5"
    Then it will raise an error "location is out of board"