class Api::V1::TimeslotsController < ApiController
  def index
    begin
      @timelists = Timelist.where(facility_id: params[:facility_id])
      @facility = Facility.find(params[:facility_id])
      @bookings = Booking.where(facility_id: params[:facility_id])
      date = params[:date]
      dateallday = date.to_datetime + 2.hours
      dateallday = dateallday.midnight..dateallday.end_of_day
      @booker = @bookings.where(start_time: dateallday)
      date = params[:date]
      @date =(date.to_time + 2.hours).strftime("%F")
    rescue => error
      render json: { message: error}, status: 404
    end
  end
end
