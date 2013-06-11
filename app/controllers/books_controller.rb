class BooksController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy]
  before_filter :correct_user,   only: [:destroy, :edit]

  def new
    @book = current_user.books.build if signed_in?
    @book.book_pages.build(page_num:1)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      flash[:success] = "Book updated"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_pages = @book.book_pages.paginate(page: params[:page], per_page: 1)
  end

  def create
    @book = current_user.books.build(params[:book])
    if @book.save
      flash[:success] = "Book created!"
      redirect_to @book.user
    else
      render 'books/new'
    end
  end

  def destroy
  	@book.destroy
  	redirect_to @book.user
  end

  private

    def correct_user
      @book = current_user.books.find_by_id(params[:id])
      redirect_to root_url if @book.nil?
    end
end