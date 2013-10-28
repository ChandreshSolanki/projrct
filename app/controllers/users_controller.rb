class UsersController < ApplicationController
  
  def home
    @user = User.new
  end
  
  def new
    @user=User.new
    @user.pictures.build
  end
  
  def welcome
    @users = User.where(:first_name => params[:first_name])
    if @users.present?
      flash[:notice] = "find match"
    else
      flash[:error] = "No match"
    end
  end
  
  def sendrequest
    @friendlists=Friendlist.new(:user_id => params[:id], :friend_id => current_user.id, :friend_staus =>"invited")
    if @friendlists.save
      redirect_to welcome_users_path
    end
  end
  
  def getrequest
    @friendlists = Friendlist.where(:user_id => current_user.id)
  end
  
  def replyrequest
    @friendlist = Friendlist.where(:friend_id => params[:friend_id]).first
    if @friendlist.present?
      @friendlist.update_column(:friend_staus, "accepted")
      Friendlist.create!(:user_id => @friendlist.friend_id, :friend_id => @friendlist.user_id, :friend_staus => "accepted")
      render :text => "done"
    else
      render :text => "error"
    end
  end
  
  def deleterequest
    @friendlist = Friendlist.where(:friend_id => params[:id]).first
    if @friendlist.present?
       @friendlist.update_column(:friend_staus, "rejected")
       redirect_to welcome_users_path
    end
  end
  
  def edituser
    @user =User.find(params[:id])
  end
  
  def updateuser
    @user = User.where(:id =>current_user.id).first
    if @user.update_attributes(params[:user])
      redirect_to  userinfo_posts_path
    end
  end
  
end

