Given(/^there is a facility named "([^"]*)"$/) do |name|
  @building = Building.find_by(name: "bighouse")
  facility = create(:facility, name: name, building_id: @building.id)
end

Given(/^I am on the booking page for "([^"]*)"$/) do |name|
  @building = Building.find_by(name: "bighouse")
  facility = Facility.find_by(name: name)
  visit "/buildings/#{@building.id}/facilities/#{facility.id}/bookings"
end

Given(/^there is a facility named and timeslot "([^"]*)"$/) do |name|
  @building = Building.find_by(name: "bighouse")
  facility = create(:facility, name: name, building_id: @building.id)
  create(:timeslot, start_time: '15:00', end_time: '18:00', facility_id: facility.id, building_id: @building.id)
end
