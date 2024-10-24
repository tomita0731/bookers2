class UsersController < ApplicationController
  
 
  def show
    @user2 = User.find(params[:id])
    @user = current_user
    @book = Book.new
    @user = current_user
    @books = @user2.books
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:notice] = "You have updated user successfully." 
    redirect_to user_path(user.id)
  end

    private

  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end
end
