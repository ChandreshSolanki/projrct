class PostsController < ApplicationController

  def userpost
    @post =Post.new(params[:post])
    if @post.save
      redirect_to welcome_users_path
    end
  end
  
  def show
     @post =Post.new
  end
   
end
