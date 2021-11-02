Feature: Add an building
  As an Admin
  In order to add a Building
  I would like to be able to add a buidling to a admin acount

  Background:
  Given the following users exist
   | email           | password  | password_confirmation | role  |
   | nubbe@nubbe.com | 12345678  | 12345678              | admin |
  Given the following buildings exist
   | name        | street      |
   | bighouse    | bigstreet   |

   Scenario: I book time slott at a facility.
     Given I am on the root page
     Then I should see "Sign up"
     And I click link "Log in"
     And I fill in "Email" with "nubbe@nubbe.com"
     And I fill in "Password" with "12345678"
     And I click "Log in"
     Then I click link "Add building"
     And I should see "Create a new building"
     And I fill in "Name" with "Bighouse"
     And I click "Create"
     Then I should see "New house created!"
