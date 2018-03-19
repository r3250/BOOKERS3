class UsersController < ApplicationController
  def index
      @book = Book.new
      @users = User.all
  end
  def edit
      @user = User.find(params[:id])
  end

  def show
      @book = Book.new
      @user = User.find(params[:id])
      @books = @user.books.all
  end

  def update
        user = User.find(params[:id])
        user.update(user_params)
        redirect_to user_path(current_user.id)
  end


    protected

    private
    def book_params
      params.require(:book).permit(:title, :opinion, :user_id)
    end
    def user_params
      params.require(:user).permit(:name, :introduction, :image_id)
    end
  end
