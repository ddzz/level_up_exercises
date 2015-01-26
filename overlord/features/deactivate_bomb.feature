Feature: Deactivate the bomb
  As a bomb recipient
  I want to deactivate the bomb
  So that it does not explode

  Background:
  	The bomb has been booted and activated

  Scenario: Bomb deactivates with default deactivation code
  	Given The bomb has been booted and activated with the default codes
  	When I enter the correct deactivation code
  	Then the bomb should deactivate

  Scenario: Bomb does not deactivate after one incorrect deactivation attempt
  	Given The bomb has been booted and activated with the default codes
  	When I enter an incorrect activation code once
  	Then the bomb should not deactivate
  	And the number of deactivation attempts remaining should be 2

  Scenario: Bomb does not deactivate after two incorrect deactivation attempts
   	Given The bomb has been booted and activated with the default codes
  	When I enter an incorrect activation code twice
  	Then the bomb should not deactivate
  	And the number of deactivation attempts remaining should be 1

  Scenario: User tries to navigate back to activation page
    Given The bomb has been booted and activated with the default codes
    When I navigate back to the activation page
    Then I should see that the bomb has already been activated
    And I should not be able to re-activate the bomb