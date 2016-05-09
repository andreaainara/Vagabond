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
      flash[:notice] = "Post created successfullly!"
      redirect_to city_path(:city_id=>@city.id)
   end

   def edit
      post_id=params[:id]
      @post=Post.find_by_id(post_id)
      render :edit
   end

   def update
      @post=Post.find_by_id(params[:id])
      post_params = params.require(:post).permit(:title, :content, :commit, :id)
      @post.update_attributes(post_params)
      redirect_to show_post_path
   end

   def destroy
      @post=Post.find_by_id(params[:id])
      # post_id=@post[:post_id]
      user=@post.user_id
      @post.destroy
      redirect_to user_path(user)

      # #user_id should equal user_id in order to edit code
      # title=params[:title]
      # content=params[:content]
      # post_id=params[:post_id]
      # post=Post.find_by_id[post_id]
      # post[:title]=title
      # post[:content]=content
      # post.save
      # fash[:success] = "Your post has been edited successfully!"
      # redirect_to city_path, :city_id=>post[:city_id]
   end

   # def delete
   #    post=Post.find_by_id[post_id]
   #    city_id=post[:city_id]
   #    post.destroy
   #    flash[:success] = "Post has been deleted"
   #    redirect_to city_path, :city_id=>city_id
#    end

   def show
      @post = Post.find_by_id(params[:id])
      render :show
   end

end
