class UserController < ApplicationController
  # POST /users
  # POST /users.json
  def index
    @users = User.where(building_id: session[:current_building_id])
  end

  def new
    @user = User.new
    @code = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
    session[:secret_user_code] = @code
  end

  def create
    @user = User.new sign_up_params
    @user.building_id = session[:current_building_id]
    if @user.save
      flash[:notice] = "New user created!"
      UserMailer.welcome_email(@user).deliver
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User Deleted!"
      redirect_back(fallback_location: user_index_path(session[:current_building_id]))
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :role, :password, :password_confirmation)
  end
end
