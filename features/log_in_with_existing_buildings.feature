Feature: Show buildings
  As an  admin
  In order to see my buildings
  I would like to see my buildings on a showpage

  Background:
   Given the following users exist
    | email           | password  | password_confirmation | role  |
    | nubbe@nubbe.com | 12345678  | 12345678              | admin |
   Given the following buildings exist
    | name        | street      |
    | bighouse    | bigstreet   |
    | smallhouse  | smallstreet |

  Scenario: I log in to choose a building
    Given I am on the root page
    Then I should see "Sign up"
    And I click link "Log in"
    And I fill in "Email" with "nubbe@nubbe.com"
    And I fill in "Password" with "12345678"
    And I click "Log in"
    Then I should see "bighouse"
    And I should see "smallhouse"
    Then I click link "smallhouse"
    And I should see "smallhouse"
