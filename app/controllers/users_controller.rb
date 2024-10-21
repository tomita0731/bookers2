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
  

    private

  def user_params
    params.require(:user).permit(:user_name, :user_introduction,)
  end
end
