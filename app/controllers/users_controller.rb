class UsersController < ApplicationController
  
  def home
  @user = User.new
  end
  
  def welcome
  end

end
