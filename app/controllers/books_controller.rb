class BooksController < ApplicationController
  
  
  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    flash[:notice] = "You have created book successfully." 
    redirect_to book_path(book.id)
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
    @book = Book.find(params[:id])
    @books = Book.all
  
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(book.id)
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id, :profile_image)
  end
end