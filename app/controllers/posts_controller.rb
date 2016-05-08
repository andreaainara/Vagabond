class PostsController < ApplicationController

  def new
     @post = Post.new
     render :new
  end

   def create
      user_id = @user.id
      @city = City.find_by(params[:id])
      title = params[:title]
      content = params[:content]
      @post = Post.create(:user_id=>user_id, :city_id=>@city.id, :title=>title, :content=>content)
      redirect_to city_path(:city_id=>@city.id)
   end

   def edit
      @post=Post.find_by_id[post_id]
      render :edit
   end

   def update
      #user_id should equal user_id in order to edit code
      title=params[:title]
      content=params[:content]
      post_id=params[:post_id]
      post=Post.find_by_id[post_id]
      post[:title]=title
      post[:content]=content
      post.save
      redirect_to city_path, :city_id=>post[:city_id]
   end

   def delete
      post=Post.find_by_id[post_id]
      city_id=post[:city_id]
      post.destroy
      redirect_to city_path, :city_id=>city_id
   end

   def show
      @post = Post.find_by_id(params[:id])
      render :show
   end

end
