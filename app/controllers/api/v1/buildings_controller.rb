class Api::V1::BuildingsController < ApiController
  def index
    if current_user
      @building = Building.find(current_user.building_id)
    else
      @building = Building.first
    end
  end
end
