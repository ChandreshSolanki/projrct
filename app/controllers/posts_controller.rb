class PostsController < ApplicationController

  def new
    @post=Post.new
    @post.pictures.build
    @pictures =current_user.posts.last.pictures 
  end
  
  def index
    @post=Post.new
    @pictures =current_user.posts.last.pictures
  end
  
  def create
    @post = current_user.posts.new(params[:post])
    if @post.save
      @pictures =@post.pictures 
      render "/posts/index"
    else
      render :text => "error"
    end
  end

end
