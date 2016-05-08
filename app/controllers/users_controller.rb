class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]

  def index
    @cities = City.all
    render :index
  end

  def new
     @user = User.new
     render :new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :current_city, :email, :password)
    @user = User.create(user_params)
    if @user.save
      login(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    user_id = current_user.id

    @user = User.find(user_id)
    @posts = Post.where(user_id: user_id)

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
     user_params = params.require(:user).permit(:first_name, :last_name, :current_city, :email)
     user.update_attributes(user_params)
     redirect_to user_path(user)
  end
end
