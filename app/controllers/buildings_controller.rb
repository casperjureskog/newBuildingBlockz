class BuildingsController < ApplicationController
  def new
    @building = Building.new
  end

  def index
    @building = Building.where(user_id: current_user)
    if params[:id2]
      @house = Building.find_by(id: params[:id2])
      session[:current_building_id] = @house.id
      redirect_to root_path
    end
  end

 def create
    @building = Building.new building_params
    @building.user_id = current_user.id
    if @building.save
      flash[:notice] = "New house created!"
      @building = Building.find_by(user_id: current_user)
      session[:current_building_id] = @building.id
      redirect_to root_path
    end
  end

 private

 def building_params
    params.require(:building).permit(:name)
  end
end
