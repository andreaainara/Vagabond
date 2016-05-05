class UsersController < ApplicationController
  def index
    render :index
  end

  def new
     @user = User.new
     render :new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :current_city, :email, :password)
    @user = User.create(user_params)

    redirect_to root_path
  end
end
