class UsersController < ApplicationController
   before_action :logged_in?, only: [:show]

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
