json.array! @facilities.each do |facility|
    json.id facility.id
    json.name facility.name
    json.description facility.description
    json.rules facility.rules
    json.status facility.status
    json.bok_dur facility.bok_dur
    json.icon facility.icon
    if current_user
      book = Booking.where(facility_id: facility.id, user_id: current_user.id)
    end
    if book == nil
    else
      json.count book.count(:all)
    end
end
