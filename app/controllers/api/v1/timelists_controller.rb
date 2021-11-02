class Api::V1::TimelistsController < ApiController
  def index
    begin
      user = User.find(current_user.id)
      @bookings = Booking.where(building_id: user.building_id, user_id: user.id)
    rescue => error
      render json: { message: error}, status: 404
    end
  end
end
