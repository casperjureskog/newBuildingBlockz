class TimeslotsController < ApplicationController
  def create
    create_schedule(params)
    flash[:notice] = "schedule created"
    redirect_back(fallback_location: building_facilities_path(session[:current_building_id]))
  end

  def destroy
    @timeslots = Timeslot.where(facility_id: params[:facility_id])
    @timeslots.each do |timeslot|
      timeslot.destroy
    end
    redirect_back(fallback_location: building_facilities_path(session[:current_building_id]))
  end



  private

  def create_schedule(params)
    start_time = params[:start_time].to_i
    slot_times = params[:time_slot].to_i
    hours = params[:hours].to_i
    timeslots = []

    slot_times.times do
      end_time = start_time + hours
      end_time %= 24 if end_time >= 24

      timeslots << {
        start_time: "#{normalize_hour(start_time)}:00:00",
        end_time: "#{normalize_hour(end_time)}:00:00",
        facility_id: params[:facility_id],
        building_id: session[:current_building_id]
      }

      start_time = end_time
    end

    timeslots.each { |ts| Timeslot.create(ts) }
  end

  def normalize_hour(time)
    time > 9 ? time : "0#{time}"
  end
end
