Feature: Show workorder
  As an  janitor
  In order to see my work orders
  I would like to see work orders on an janitor index page

  Background:
  Given the following users exist
    | email           | password  | password_confirmation | role  |
    | nubbe@nubbe.com | 12345678  | 12345678              | admin |
  And the following buildings exist
    | name        | street      |
    | bighouse    | bigstreet   |
  Given the following work orders messages exist
    | title   | message           | urgent | location |
    | Fabian  | Missing phone     | true   | bighouse |

  Scenario: I create and send a work order
    Given I am on the root page
    Then I should see "Sign up"
    And I click link "Log in"
    And I fill in "Email" with "nubbe@nubbe.com"
    And I fill in "Password" with "12345678"
    And I click "Log in"
    Given I am on the work orders index page
    Then I should see "Work order"
    And I should see "Fabian"
    And I should see "Missing phone"
    And I should see "bighouse"
