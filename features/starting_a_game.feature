Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Registering
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"
    When I fill in "name" with "Brandon"
    And I press "Submit"
    Then I should see "Let's play Brandon!"

  Scenario: The player does not put a name
    Given I am on "What's your name?"
    When I fill in "name" with ""
    And I press "Submit"
    Then I should see "What's your name"