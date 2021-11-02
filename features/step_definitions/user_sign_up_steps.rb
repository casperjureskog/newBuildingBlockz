Given(/^I am on the root page$/) do
  visit root_path
end

Given(/^I click link "([^"]*)"$/) do |link|
  click_link link
end

Given(/^I am on the registration page$/) do
  visit new_user_registration_path
end

Then(/^I select "([^"]*)" from "([^"]*)"$/) do |option, choices|
  select option, from: choices
end

Then(/^"([^"]*)" should be marked as "([^"]*)"$/) do |email, option|
  user = User.find_by(email: email)
  expect(user.role).to eq option
end

Given(/^I am on the sign in page$/) do
  visit new_user_session_path
end
