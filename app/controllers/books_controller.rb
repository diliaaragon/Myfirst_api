class BooksController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_book, only: [ :show, :update, :destroy ]

  def index
    @books = Book.all
    json_response(@books)
  end

  def create
    @book = Book.create!(book_params)
    json_response(@book, :create)
  end

  def show
    json_response(@book)
  end

  def update
    @book.update(book_params)
    head :no_content
  end

  def destroy
    @book.destroy
    head :no_content
  end

  private

  def book_params
    params.permit(:title, :presentation, :edition, :language, :number_of_page, :ISBN)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
