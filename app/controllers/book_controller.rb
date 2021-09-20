class BookController < ApplicationController
  before_action :baria_user, only: [:edit, :destroy, :update]
  before_action :ensure_current_book, {only: [:edit, :update]}
  def ensure_current_book
    if @current_user.id != params[:id].to_i
      redirect_to("/book/index")
    end
  end
  
  def new
    @book = Book.new
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: 'Book was successfully created!'
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'Book was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_index_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)

  end

  def baria_user
    unless Book.find(params[:id]).user.id.to_i == current_user.id
      redirect_to book_path(current_user)
    end
  end
end