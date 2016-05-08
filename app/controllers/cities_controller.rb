class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @posts = @city.posts
    render :show
  end
end
