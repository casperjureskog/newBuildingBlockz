Given(/^the following help request messages exist$/) do |table|
  building = Building.find_by(name: "bighouse")
  table.hashes.each do |hash|
    create(:help_request, title: hash[:title], message: hash[:message], urgent: hash[:urgent], user_id: @user.id, building_id: building.id)
  end
end

Given(/^I am on the show help request page$/) do
  building = Building.find_by(name: "bighouse")
  visit building_help_requests_path(building)
end
