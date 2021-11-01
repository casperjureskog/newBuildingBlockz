Given(/^I am on the create news post page$/) do
  building = Building.find_by(name: 'bighouse')
  visit new_building_news_path(building)
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Then(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
 fill_in field, with: content
end

Then(/^I click "([^"]*)"$/) do |button|
  click_button button
end

Then(/^I click link"([^"]*)"$/) do |button|
  click_link link
end

Then(/^show me the page$/) do
 save_and_open_page
end

Given(/^I should not see "([^"]*)"$/) do |content|
  expect(page).not_to have_content content
end

Given(/^I am on the index page$/) do
  visit root_path
end

Given(/^the following users exist$/) do |table|
  table.hashes.each do |hash|
   @user = create(:user, hash)
  end
end

Given(/^the following buildings exist$/) do |table|
  user = User.find_by(email: "nubbe@nubbe.com")
  table.hashes.each do |hash|
   create(:building, name: hash[:name], street: hash[:street], user_id: user.id)
  end
end

Given(/^the following janitor exist$/) do |table|
  building = Building.find_by(name: "bighouse")
  table.hashes.each do |hash|
   create(:user, email: hash[:email], password: hash[:password],password_confirmation: hash[:password_confirmation], role: hash[:role], building_id: building.id)
  end
end

Given(/^I am logged in as "([^"]*)"$/) do |email|
  user = User.find_by(email: email)
  login_as(user, scope: :user)
end
