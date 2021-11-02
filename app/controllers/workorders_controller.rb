class WorkordersController < ApplicationController
  def index
    @building = Building.find(session[:current_building_id])
    @workorders = Workorder.where(building: @building)
  end

  def update
    @workorder = Workorder.find(params[:id])
    if params[:status] != ''
      @workorder.update(status: params[:status])
      flash[:notice] = "Work order status updated"
      redirect_back(fallback_location: workorders_path)
    end
  end

  def new
    @building = Building.find(session[:current_building_id])
    @workorder = Workorder.new
    if params[:format]
      @help_request = HelpRequest.find(params[:format])
    end
  end

  def create
    @workorder = Workorder.new workorder_params
    @workorder.building_id = session[:current_building_id]
    if params[:id]
      @workorder.update(help_request_id: params[:help_request_id])
      HelpRequest.find(params[:help_request_id]).update(workorder_id: @workorder.id)
    end
    if @workorder.save
      flash[:notice] = "New work order sent !!"
      redirect_back(fallback_location: new_building_workorder_path(session[:current_building_id]))
    end
  end

  private

  def workorder_params
    params.require(:workorder).permit(:title, :message, :location, :urgent, :status, :id, :name )
  end
end
