class PostsController < ApplicationController

  def new
    @post=Post.new
    @friendlists = Friendlist.new
    @post.pictures.build
  end
  
  def index
    @post = Post.new
    @user=User.all
    @post.pictures.build
    friend_ids = current_user.friends.pluck(:id)
    friend_ids << current_user.id
    @posts = Post.where("user_id IN (?)", friend_ids)
  end
  
  def create
   @post = current_user.posts.build(params[:post])
    if(@post.save)
      redirect_to posts_path 
    end
  end

  def add_comment
    @post=Post.find(params[:p_id])
    @comment = @post.comments.new(:user_id=>current_user.id, :content=>params[:text])
    if(@comment.save)
      render :text => "comment"
    end
  end
  
  def add_likepost
    @post=Post.find(params[:p_id])
    rating = @post.ratings.where(:user_id => current_user.id).first
    if rating  
      rating.update_column(:like, false)
      render :text => "post unlike"
    else  
      @post.ratings.create(:user_id=>current_user.id, :like=>true)
      render :text => "post liked"
    end
  end
  
  def add_likecomment
    @comment=Comment.find(params[:p_id])
    rating =@comment.ratings.where(:user_id => current_user.id).first
    if rating  
      rating.update_column(:like, false)
      render :text => "comment unlike"
    else  
      @comment.ratings.create(:user_id=>current_user.id, :like=>true)
      render :text => "comment liked"
    end
  end
  
  def userinfo
    @user = User.where(:id => current_user.id).first
  end
  
  def friendinfo
    @user = User.find(params[:id])
    @friendlists = @user.friendlists.where(:friend_staus => "accepted")
  end
  
  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
end
