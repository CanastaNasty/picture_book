class StaticPagesController < ApplicationController
  def home
  	@book = current_user.books.build if signed_in?
  end

  def about
  end

  def contact
  end
end
