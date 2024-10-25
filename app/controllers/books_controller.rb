class BooksController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update]


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save

     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end


  def show
    @book2 = Book.find(params[:id])
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @book2 = Book.find(params[:id])
    @books = Book.all

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    @book2 = Book.find(params[:id])
    if @book2.update(book_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book2.id)
    else
      @books = Book.all
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id, :profile_image)
  end
  
  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
    redirect_to books_path
    end
  end
end