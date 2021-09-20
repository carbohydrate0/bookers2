class UsersController < ApplicationController
  def show
    @users = User.all
    @book = Book.new
  end
  def edit
    # @user = User.find(params[:id])
    @user = current_user
  end

  def update
    # @user = User.find(params[:id])
    @user = current_user
    @user.update(user_params)
    redirect_to book_index_path
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
