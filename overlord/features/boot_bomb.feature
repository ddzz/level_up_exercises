Feature: Bomb boots with activation and deactivation codes set
  As a super-villian
  I want to boot the bomb
  So that I can activate or deactivate the bomb

  Background:  
    Given I am on the home page

  Scenario: Visit home page (happy)
    Then I see fields to enter codes to boot the bomb
    And I see a button to boot the bomb

  Scenario: Use default activation/deactivation codes (happy)
    When I try to boot the bomb
    Then the bomb is booted and deactivated

  Scenario: Enter custom activation/deactivation codes (happy)
    When I enter "1111" for the activation code
    And I enter "2222" for the deactivation code
    And I try to boot the bomb
    Then the bomb is booted and deactivated

  Scenario: Enter invalid activation code (bad)
    When I enter "abc" for the activation code
    And I enter "1111" for the deactivation code
    And I try to boot the bomb
    Then the bomb is not booted

  Scenario: Enter invalid deactivation code (bad)
    When I enter "2222" for the activation code
    And I enter "#{]&" for the deactivation code
    And I try to boot the bomb
    Then the bomb is not booted
