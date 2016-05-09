class PostsController < ApplicationController

  def new
     @post = Post.new
     render :new
  end

   def create
      user_id = current_user.id
      @city = City.find_by_id(params[:id])
      title = params[:post][:title]
      content = params[:post][:content]
      @post = Post.create(:user_id=>user_id, :city_id=>@city.id, :title=>title, :content=>content)
      redirect_to city_path(:city_id=>@city.id)
   end

   def edit
      post_id=params[:id]
      @post=Post.find_by_id(post_id)
      puts 1
      puts @post
      puts 2
      render :edit
   end

   def update
      @post=Post.find_by_id(params[:id])
      post_params = params.require(:post).permit(:title, :content, :commit, :id)
      @post.update_attributes(post_params)
      redirect_to show_post_path
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
