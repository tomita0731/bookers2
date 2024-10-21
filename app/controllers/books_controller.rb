class BooksController < ApplicationController
  
  def new
   
  end
  
  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to "/books/show"
  end
  
  def show
    @book = Book.find(params[:id])
    @books = @user.books
    @profile_image = @user.profile_image
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
    
   
  end

  def edit
  
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end