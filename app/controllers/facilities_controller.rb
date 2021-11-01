class FacilitiesController < ApplicationController

  def index
    @facilities = Facility.where(building_id: session[:current_building_id])
    @building = Building.find(session[:current_building_id])
  end

  def show
    @facility = Facility.find(params[:id])
    @building = Building.find(session[:current_building_id])
  end

  def new
    @facility = Facility.new
    @building = Building.find(session[:current_building_id])
  end

  def edit
    @facility = Facility.find(params[:id])
    @building = Building.find(session[:current_building_id])
  end

  def update
    @facility = Facility.find(params[:id])
    if @facility.update facility_params
      flash[:notice] = "Facility Is updated"
      redirect_back(fallback_location: building_news_index_path(session[:current_building_id]))
    end
  end

  def create
    @facility = Facility.new facility_params
    @facility.building_id = session[:current_building_id]
    if @facility.save
      flash[:notice] = "New facility created!"
      redirect_back(fallback_location: new_building_facility_path(session[:current_building_id]))
    end
  end

  def destroy
    @facility = Facility.find(params[:id])
    if @facility.destroy
      flash[:notice] = "Facility Deleted!"
      redirect_back(fallback_location: building_facilities_path(session[:current_building_id]))
    end
  end

  private

  def facility_params
    params.require(:facility).permit(:name, :description, :status, :rules, :dyntime, :bok_dur, :bok_day, :icon )
  end
end
