Feature: Booking an facility
  As an tenant
  In order to book a time at a facility
  I would like to be able to select a time slott at a facility.

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
    Given there is a facility named and timeslot "Laundry Room"
    And I am on the booking page for "Laundry Room"
    And I click link "18"
    Then I should see "New booking"
    And I click link "Time 15:00-18:00"
    Then I should see "Booking was successfully created."
    When I am on the booking page for "Laundry Room"
    Then I should see "18 Admin 15:00"
