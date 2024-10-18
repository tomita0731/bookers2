class UsersController < ApplicationController
  
 
  def show
    @users = User.find(params[:id])
    @user = current_user
  end

  def index
    @users = User.all
    
  end

  def edit
  end
  

    
end
