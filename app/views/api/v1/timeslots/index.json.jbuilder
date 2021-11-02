if @facility.dyntime == "on"
  json.array! @booker.sort_by(&:start_time).each do |booking|
    if "#{current_user.first_name} #{current_user.last_name}" == booking.name
      json.my "true"
    end
    json.name booking.name
    json.bookt 'Booked'
    json.start_time booking.start_time.strftime("%H:%M:%S")
    json.end_time booking.end_time.strftime("%H:%M:%S")
    json.ids booking.id
  end
  date = @date.to_datetime
  date = date.midnight..date.end_of_day
  json.array! @facility.timelists.each do |timelist|
  if @bookings.where(start_time: date) == []
    json.time timelist.time.strftime("%H:%M:%S").to_s
    json.value timelist.time.strftime("%H:%M:%S")
  else
    bookings = " "
    @bookings.where(start_time: date).sort_by(&:start_time).each do |bo|
      bostart = bo.start_time.to_time + 1
      boend = bo.end_time.to_time - 1
      atime = timelist.time.strftime("%H:%M:%S")
      mim = @bookings.where(start_time: date).minimum(:start_time)
      mxm = @bookings.where(start_time: date).maximum(:end_time)
      if atime.between?(bostart.strftime("%H:%M:%S"), boend.strftime("%H:%M:%S"))
        json.time "bookt #{timelist.time.strftime("%H:%M:%S")}"
        json.value ""
        json.mim mim.strftime("%H:%M:%S")
        json.mxm mxm.strftime("%H:%M:%S")
        bookings = "bookt #{timelist.time.strftime("%H:%M:%S")}"
      else
        if bookings == "bookt #{timelist.time.strftime("%H:%M:%S")}"
        else
          json.time timelist.time.strftime("%H:%M:%S")
          json.value timelist.time.strftime("%H:%M:%S")
        end
      end
    end
  end
end
else
  timeslotmim = @facility.timeslots.minimum(:start_time)
  timeslotmxm = @facility.timeslots.maximum(:end_time)
  maxtime = "#{@date} #{timeslotmxm}".to_time
  json.array! @facility.timeslots.each do |timeslot|
    if timeslot.start_time == timeslotmim
      start_date1 = "#{@date} 02:00:00".to_time
    else
      start_date1 = "#{@date} #{timeslot.start_time}".to_time
    end
      end_date1 = "#{@date} #{timeslot.end_time}".to_time
      start_date = "#{@date} #{timeslot.start_time}".to_time + 1
      end_date = "#{@date} #{timeslot.end_time}".to_time - 1
      start_date2 = "#{@date} #{timeslot.start_time}".to_time
      end_date2 = "#{@date} #{timeslot.end_time}".to_time - 1
    if start_date2 > end_date2
      end_date2 = end_date2 + 1.days
      end_date = end_date + 1.days
    end
    if @bookings.find_by(['start_time BETWEEN ? AND ?', start_date1.to_s, end_date.to_s,]) == nil && @bookings.find_by(['end_time  BETWEEN ? AND ?', start_date.to_s , end_date1.to_s,]) == nil
      json.start_time timeslot.start_time
      json.end_time timeslot.end_time
    elsif
      booking = @bookings.find_by(['start_time BETWEEN ? AND ?', start_date2.to_s, end_date.to_s,])
      if booking == nil
       else
        if "#{current_user.first_name} #{current_user.last_name}" == booking.name
          json.my "true"
        end
        json.name booking.name
        json.bookt 'Booked'
        json.start_time booking.start_time.strftime("%H:%M:%S")
        json.end_time booking.end_time.strftime("%H:%M:%S")
        json.ids booking.id
      end
      if timeslot.end_time == timeslotmxm
        end_end = "#{@date} 23:00:00".to_time
        last_time = "#{@date} #{timeslotmxm}".to_time
        last_book = @bookings.find_by(['start_time BETWEEN ? AND ?', last_time.to_s, end_end.to_s,])
        if last_book == nil
        else
         json.name last_book.name
         json.bookt 'Booked'
         json.start_time last_book.start_time.strftime("%H:%M:%S")
         json.end_time last_book.end_time.strftime("%H:%M:%S")
         json.ids last_book.id
        end
      end
    end
  end
  date = @date.to_datetime
  date = date.midnight..date.end_of_day
  json.array! @facility.timelists.each do |timelist|
    if @bookings.where(start_time: date) == []
      json.time timelist.time.strftime("%H:%M:%S").to_s
      json.value timelist.time.strftime("%H:%M:%S")
    else
      bookings = " "
    @bookings.where(start_time: date).sort_by(&:start_time).each do |bo|
      bostart = bo.start_time.to_time + 1
      boend = bo.end_time.to_time - 1
      atime = timelist.time.strftime("%H:%M:%S")
      mim = @bookings.where(start_time: date).minimum(:start_time)
      mxm = @bookings.where(start_time: date).maximum(:end_time)
      if atime.between?(bostart.strftime("%H:%M:%S"), boend.strftime("%H:%M:%S"))
        json.time "bookt #{timelist.time.strftime("%H:%M:%S")}"
        json.value ""
        bookings = "bookt #{timelist.time.strftime("%H:%M:%S")}"
      else
        if bookings == "bookt #{timelist.time.strftime("%H:%M:%S")}"
        else
        json.time timelist.time.strftime("%H:%M:%S")
        json.value timelist.time.strftime("%H:%M:%S")
       end
     end
    end
  end
  end
end
