class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]
  
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

    login(@user)
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def edit
    user_id = params[:id]
     @user = User.find_by_id(user_id)
     render :edit
  end

  def update
     user_id = params[:id]
     user = User.find_by_id(user_id)
     user_params = params.require(:user).permit(:name, :description)
     user.update_attributes(user_params)
    redirect_to user_path(user)
  end
end
