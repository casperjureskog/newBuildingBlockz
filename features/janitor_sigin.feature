Feature: Jaintor sign in
  As an jaintor
  In order to see my workorders u
  I would like to be able to sign in and see my workorder page.

  Background:
    Given the following users exist
      | email           | password  | password_confirmation | role  |
      | nubbe@nubbe.com | 12345678  | 12345678              | admin |
    And the following buildings exist
      | name        | street      |
      | bighouse    | bigstreet   |
    Given the following janitor exist
      | email       | password  | password_confirmation | role    |
      | nub@nub.com | 12345678  | 12345678              | janitor |


    Scenario: I sign in and look at workorders
      Given I am on the sign in page
      And I fill in "Email" with "nub@nub.com"
      And I fill in "Password" with "12345678"
      And I click "Log in"
      Then I should not see "Home"
      And I should see "Work orders"
