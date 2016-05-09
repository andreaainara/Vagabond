class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @posts = @city.posts
    # p @posts
    # user_id = @posts.user_id
    # @user = User.find_by_id(user_id)
    render :show
  end
end
