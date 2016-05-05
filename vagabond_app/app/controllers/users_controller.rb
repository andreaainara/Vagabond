class UsersController < ApplicationController
   def index
      @users = User.all
      render :index
   end





####Show profile page####
   def show
      @user = User.find_by_id(params[:id])
      render :show
   end
end
