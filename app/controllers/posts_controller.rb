class PostsController < ApplicationController

  def new
    @post=Post.new
    @friendlists = Friendlist.new
    @post.pictures.build
  end
  
  def index
     @post = Post.new
     @post.pictures.build
     @posts = current_user.posts
  end
  
  def create
   @post = current_user.posts.build(params[:post])
    if(@post.save)
     redirect_to posts_path
    end
  end

  def add_comment
    @post=Post.find(params[:p_id])
    @comment = @post.comments.new
    @comment = Comment.new(:post_id=>params[:p_id], :user_id=>current_user.id, :content=>params[:text])
    if(@comment.save)
      render :partial => 'comment'
    end
  end
  
  def add_likepost
    @post=Post.find(params[:p_id])
    if @post.ratings.create(:user_id=>current_user.id, :like=>true)
      redirect_to posts_path 
    end 
  end
  
  def add_likecomment
    @comment=Comment.find(params[:p_id])
    if @comment.ratings.create(:user_id=>current_user.id, :like=>true)
      redirect_to posts_path 
    end 
  end
  
end
