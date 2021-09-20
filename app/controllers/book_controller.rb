class BookController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = current_user.book
    @user = current_user
    # @user_book = 
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_detail_path
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def detail
    @user = current_user
    @books = current_user.book
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_detail_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_detail_path
  end
  
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end