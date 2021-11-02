class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # before_action :delete_booking, only: [:destroy]
  #
  # def delete_booking
  #   binding.pry
  #   @facility = Facility.find(params[:facility_id])
  # end
end
