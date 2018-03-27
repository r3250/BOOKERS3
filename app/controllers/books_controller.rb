class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_book, only:[:edit, :update]
  
  def index
      @book = Book.new
      @books = Book.all
  end

  def create
  	book = Book.new(book_params)
    book.user_id = current_user.id
  	if book.save
  	redirect_to book_path(book.id), notice: '投稿成功'
    else
    @book = book
    @books = Book.all
    render "/books/index"
    end
  end

  def show
    @post = Book.new
    @book = Book.find(params[:id])
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

    private
    def book_params
    	params.require(:book).permit(:title, :opinion, :user_id)
    end

    def correct_book
      book = Book.find(params[:id])
      if current_user != book.user
         redirect_to books_path
      end
    end

end
