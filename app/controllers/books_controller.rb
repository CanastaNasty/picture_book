class BooksController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
    @book = current_user.books.build(params[:book])
    if @book.save
      flash[:success] = "Book created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  	@book.destroy
  	redirect_to root_url
  end

  private

    def correct_user
      @book = current_user.books.find_by_id(params[:id])
      redirect_to root_url if @book.nil?
    end
end