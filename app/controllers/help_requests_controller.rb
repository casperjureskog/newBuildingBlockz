class HelpRequestsController < ApplicationController
  def index
    @help_requests = HelpRequest.where(building_id: session[:current_building_id]).last(20)
  end

  def destroy
    @help_request = HelpRequest.find(params[:id])
    binding.pry
    if @help_request.destroy
      flash[:notice] = "Help Request Deleted!"
      redirect_back(fallback_location: building_help_requests_path(session[:current_building_id]))
    end
  end
end
