Feature: Menu with buildings
  As an Admin
  In order to select a Building
  I would like to be able to select a buidling from a menu

  Background:
  Given the following users exist
   | email           | password  | password_confirmation | role  |
   | nubbe@nubbe.com | 12345678  | 12345678              | admin |
  Given the following buildings exist
   | name        | street      |
   | bighouse    | bigstreet   |
   | smallhouse  | smallstreet |

   Scenario: I log in and select a building
     Given I am on the root page
     Then I should see "Sign up"
     And I click link "Log in"
     And I fill in "Email" with "nubbe@nubbe.com"
     And I fill in "Password" with "12345678"
     And I click "Log in"
     And I should see "smallhouse"
     Then I click link "smallhouse"
     And I should see "smallhouse"
     Then I select "bighouse" from "post_category"
     And I click "Change"
     And I should see "bighouse"
