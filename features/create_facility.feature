Feature: Create a new facility
  As an administrator
  In order to show the buldings facility's
  I would like to be able to create a new facility's.

  Background:
   Given the following users exist
    | email           | password  | password_confirmation | role  |
    | nubbe@nubbe.com | 12345678  | 12345678              | admin |
   Given the following buildings exist
    | name        | street      |
    | bighouse    | bigstreet   |

  Scenario: I create a new new facility
    Given I am on the root page
    Then I should see "Sign up"
    And I click link "Log in"
    And I fill in "Email" with "nubbe@nubbe.com"
    And I fill in "Password" with "12345678"
    And I click "Log in"
    Given I am on the create news facility page
    Then I should see "Create a new facility"
    And I fill in "Name" with "yard"
    And I fill in "Description" with "dog yard"
    And I fill in "Rules" with "no dog's!!!"
    And I check Available check box
    And I click "Submit"
    Then I should see "New facility created!"
