class BooksController < ApplicationController
  
  
  def index
  end

  def show
   
  end

  def index
    @users = User.all
    @user = current_user
  end

  def edit
  end
end
