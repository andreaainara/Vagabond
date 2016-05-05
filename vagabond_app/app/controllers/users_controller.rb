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

   def edit
      user_id = params[:id]
      @user = User.find_by_id(user_id)
      if @user.save
      end
   end

end
