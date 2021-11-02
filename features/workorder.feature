Feature: Creat a new workorder
  As an administrator
  In order to provide the janitor with work orders
  I would like to be able to send a work orders to the janitor

  Background:
  Given the following users exist
    | email           | password  | password_confirmation | role  |
    | nubbe@nubbe.com | 12345678  | 12345678              | admin |
  And the following buildings exist
    | name        | street      |
    | bighouse    | bigstreet   |
  Given the following help request messages exist
    | title   | message           | urgent |
    | Fabian  | Missing phone     | true   |


  Scenario: I create and send a work order
    Given I am on the root page
    Then I should see "Sign up"
    And I click link "Log in"
    And I fill in "Email" with "nubbe@nubbe.com"
    And I fill in "Password" with "12345678"
    And I click "Log in"
    And I click link "New Work order"
    Then I should see "Send work order"
    And I fill in "Title" with "Fabian"
    And I fill in "Message" with "Missing phone"
    And I fill in "Location" with "Västervik"
    And I check Urgent check box
    And I click "Send"
    Then I should see "New work order sent !!"

  Scenario: I create and send a work order
    Given I am on the root page
    Then I should see "Sign up"
    And I click link "Log in"
    And I fill in "Email" with "nubbe@nubbe.com"
    And I fill in "Password" with "12345678"
    And I click "Log in"
    Given I am on the show help request page
    And I click link "Create work order"
    Then I should see "Send work order"
    And I should see "Fabian" in field "workorder_title"
    And I should see "Missing phone"
    And I fill in "Location" with "Västervik"
    And I check Urgent check box
    And I click "Send"
    Then I should see "New work order sent !!"
