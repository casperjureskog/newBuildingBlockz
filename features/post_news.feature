Feature: Post news
  As an administrator
  In order to keep my tenants up to date with news and events regarding the building
  I would like to be able to create a news item.

  Background:
   Given the following users exist
    | email           | password  | password_confirmation | role  |
    | nubbe@nubbe.com | 12345678  | 12345678              | admin |
   And the following buildings exist
    | name        | street      |
    | bighouse    | bigstreet   |

  Scenario: I create a new news post
    Given I am on the root page
    Then I should see "Sign up"
    And I click link "Log in"
    And I fill in "Email" with "nubbe@nubbe.com"
    And I fill in "Password" with "12345678"
    And I click "Log in"
    Given I am on the create news post page
    Then I should see "Create a news message"
    And I fill in "Title" with "house fiesta"
    And I fill in "Description" with "big burrito"
    And I click "Submit"
    Then I should see "News post created!"
