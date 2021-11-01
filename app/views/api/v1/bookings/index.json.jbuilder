json.array! @facility.bookings.each do |bookings|
    json.id bookings.id
    json.name bookings.name
    json.start_time bookings.start_time
end
