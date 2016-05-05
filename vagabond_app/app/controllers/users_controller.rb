class UsersController < ApplicationController
<<<<<<< HEAD
   def index
      @users = User.all
      render :index
   end

####Stores new account in db // sign up page?
   def new
      @user = User.new
      render :new
   end


####Sending user info to city-user post join table#####
   def create
      user_params = params.require( :user).permit( :first_name, :last_name, :created_at, :current_city)
      @user = User.create(user_params)
   end

####Show profile page####
   def show
      @user = User.find_by_id(params[:id])
      render :show
   end
end
