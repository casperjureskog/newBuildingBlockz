json.array! @bookings.each do |timelist|
  json.start_time timelist.start_time.strftime("%F %H:%M:%S")
  json.end_time timelist.end_time.strftime("%H:%M:%S")
  json.name  Facility.find(timelist.facility.id).name
  json.idb timelist.id
  json.id Facility.find(timelist.facility.id).id
end
