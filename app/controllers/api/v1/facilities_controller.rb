class Api::V1::FacilitiesController < ApiController
  def index
    if current_user
      @facilities = Facility.where(building_id: current_user.building_id)
    else
      @facilities = Facility.all
    end
  end

  def show
    begin
      @facility = Facility.find(params[:id])
    rescue => error
      render json: { message: error}, status: 404
    end
  end
end
