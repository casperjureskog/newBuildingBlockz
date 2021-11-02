class TimelistsController < ApplicationController
  def create
    create_timelist(params)
    flash[:notice] = "Time list created"
    redirect_back(fallback_location: building_facilities_path(session[:current_building_id]))
  end

  def destroy
    @timelists = Timelist.where(facility_id: params[:facility_id])
    @timelists.each do |timelists|
      timelists.destroy
    end
    redirect_back(fallback_location: building_facilities_path(session[:current_building_id]))
  end

  private

  def create_timelist(params)
    start_time = "#{params[:start_time]}:00:00".to_time + 2.hours
    gap = params[:gap].to_i
    end_times = "#{params[:end_time]}:00:00".to_time + 2.hours + gap.minutes
    if start_time > end_times
    end_times = end_times + 1.days
    end
    timelists = []

    until start_time == end_times do
      start_time = start_time

      timelists << {
        time: start_time,
        facility_id: params[:facility_id],
      }
      start_time = start_time + gap.minutes
    end

    timelists.each { |ts| Timelist.create(ts) }
  end
end
