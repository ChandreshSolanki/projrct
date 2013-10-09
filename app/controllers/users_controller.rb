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
    @friendlists=Friendlist.new(:user_id => current_user.id, :friend_id => params[:id], :friend_staus =>"invited")
    if @friendlists.save
    end
  end
  
  def getrequest
    @friendlists = Friendlist.where(:user_id => current_user.id )
  end
  
  def replyrequest
    #@friendlist = Friendlist.find_by_id(params[:friend_id])
    @friendlist = Friendlist.where(:friend_id => params[:friend_id]).first
    if @friendlist.present?
      @friendlist.update_column(:friend_staus, "accepted")
      render :text => "done"
    else
      render :text => "error"
    end
  end
  
  def destroy
    @friendlist = Friendlist.where(:friend_id => params[:friend_id])
    if @friendlist.present?
       @friendlist.destroy
    end
  end
  
  def uploadimage
    @picture = Picture.new(params[:image])
    @picture.save
  end
  
end
