class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_facility, only: [:index, :new, :show, :edit, :create]

  def index
    @bookings = @facility.bookings
    @building = Building.find(session[:current_building_id])
  end

  def show
      @building = Building.find(session[:current_building_id])
  end

  def new
    @facility = Facility.find(params[:facility_id])
    @date = params[:date]
    @bookings = Booking.where(facility_id: params[:facility_id])
    @building = Building.find(session[:current_building_id])
  end

  def edit
  end

  def create
    @booking = Booking.new(start_time: params[:start_date], end_time: params[:end_date], name: 'Admin',facility_id: params[:facility_id], building_id: session[:current_building_id])
    @booking.user_id = current_user.id

    respond_to do |format|
      if @booking.save
        format.html { redirect_to building_facility_booking_path(session[:current_building_id], @facility, @booking) , notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
        @stat = BookingStat.where(facility_id: params[:facility_id], created_at: params[:start_date].to_date)
        if @stat != []
          @stat[0].day = @stat[0].day + (((params[:end_date].to_time - params[:start_date].to_time) / 3600) * 4.16)
          @stat[0].save
        else
          @stat = BookingStat.new(day: (((params[:end_date].to_time - params[:start_date].to_time) / 3600) * 4.16), facility_id: params[:facility_id], created_at: params[:start_date].to_date)
          @stat.save
        end
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to "/buildings/#{session[:current_building_id]}/facilities/#{params[:facility_id]}/bookings", notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_facility
    @facility = Facility.find(params[:facility_id])
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:name, :start_time)
    end
end
