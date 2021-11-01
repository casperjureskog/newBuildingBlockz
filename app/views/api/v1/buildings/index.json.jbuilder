json.id @building.id
json.name @building.name
book = Booking.where(user_id: current_user)
if book == nil
else
  json.count book.count(:all)
end
