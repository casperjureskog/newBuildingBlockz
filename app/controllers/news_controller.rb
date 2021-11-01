class NewsController < ApplicationController

  def index
    @news = News.where(building_id: session[:current_building_id])
  end

  def new
    @building = Building.find(session[:current_building_id])
    @news = News.new
  end

  def create
    @news = News.new news_params
    @news.building_id = session[:current_building_id]
    if @news.save
      flash[:notice] = "News post created!"
      redirect_back(fallback_location: building_news_index_path(session[:current_building_id]))
    end
  end

  def edit
    @news = News.find(params[:id])
    @buildings = Building.find(session[:current_building_id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update news_params
      flash[:notice] = "News post created!"
      redirect_back(fallback_location: building_news_index_path(session[:current_building_id]))
    end
  end

  def destroy
    @news = News.find(params[:id])
    if @news.destroy
      flash[:notice] = "News post Deleted!"
      redirect_back(fallback_location: building_news_index_path(session[:current_building_id]))
    end
  end

  private

  def news_params
    params.require(:news).permit(:title, :description)
  end
end
