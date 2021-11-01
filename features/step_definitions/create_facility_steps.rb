Given(/^I am on the create news facility page$/) do
  building = Building.find_by(name: 'bighouse')
  visit new_building_facility_path(building)
end

Then(/^I check Available check box$/) do
  check 'facility_status'
end

Given(/^I am on the facility index page$/) do
  building = Building.find_by(name: 'bighouse')
  visit building_facilities_path(building.id)
end
