Feature: Invite a user
  As an admin
  In order to invite a user to a buidlding
  I would like to be able to create a user and send an invite

  Background:
  Given the following users exist
   | email           | password  | password_confirmation | role  |
   | nubbe@nubbe.com | 12345678  | 12345678              | admin |
  Given the following buildings exist
   | name        | street      |
   | bighouse    | bigstreet   |


  Scenario: I create and send an invite.
    Given I am on the root page
    Then I should see "Sign up"
    And I click link "Log in"
    And I fill in "Email" with "nubbe@nubbe.com"
    And I fill in "Password" with "12345678"
    And I click "Log in"
    Then I click link "invite new user"
    And I fill in "Email" with "morgan@morgan.com"
    And I select "tenant" from "Role"
    And I click "Sign up"
    # And I should see "New user created!"
