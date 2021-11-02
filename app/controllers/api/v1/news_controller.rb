class Api::V1::NewsController < ApiController
  def index
    if current_user
      @news = News.where(building_id: current_user.building_id)
    else
      @news = News.all
    end
  end
end
