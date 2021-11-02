Given(/^the following news exist$/) do |table|
  building = Building.find_by(name: "bighouse")
  table.hashes.each do |hash|
    create(:news, title: hash[:title], description: hash[:description], building_id: building.id)
  end
end
