Then(/^I check Urgent check box$/) do
  check 'workorder_urgent'
end

Then(/^I should see "([^"]*)" in field "([^"]*)"$/) do |value, field|
  expect(find_field(field).value).to eq value
end

Given(/^the following work orders messages exist$/) do |table|
  building = Building.find_by(name: "bighouse")
  table.hashes.each do |hash|
    create(:workorder, title: hash[:title], message: hash[:message], location: hash[:location], urgent: hash[:urgent], building_id: building.id)
  end
end

Given(/^I am on the work orders index page$/) do
  building = Building.find_by(name: "bighouse")
  visit building_workorders_path(building)
end
