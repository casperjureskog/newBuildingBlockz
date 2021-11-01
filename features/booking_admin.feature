Feature: Admin booking page
  As an administrator
  In order to sett up roles for booking a facilities
  I would like to be able to manage the facilities booking settings.

  Background:
   Given the following users exist
    | email           | password  | password_confirmation | role  |
    | nubbe@nubbe.com | 12345678  | 12345678              | admin |
   Given the following buildings exist
    | name        | street      |
    | bighouse    | bigstreet   |

  Scenario: Create booking schedule for a facility
    Given I am on the root page
    Then I should see "Sign up"
    And I click link "Log in"
    And I fill in "Email" with "nubbe@nubbe.com"
    And I fill in "Password" with "12345678"
    And I click "Log in"
    Given there is a facility named "Laundry Room"
    And I am on the facility index page
    And I click link "Manage timeslots"
    And I select "9" from "stime"
    And I select "5" from "time_slot"
    And I select "3" from "hours"
    And I click "Set schedule"
    Then I should see "schedule created"
    And I am on the facility index page
    And I click link "Manage timeslots"
    Then I should see "09:00:00 12:00:00"
    And I should see "12:00:00 15:00:00"
    And I should see "15:00:00 18:00:00"
    And I should see "18:00:00 21:00:00"
    And I should see "21:00:00 00:00:00"
