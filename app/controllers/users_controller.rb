class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
 
  def show
    @user2 = User.find(params[:id])
    @user = current_user
    @book = Book.new
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
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "You have updated user successfully." 
     redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

    private

  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image, :user_id)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
end
