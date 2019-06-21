class AuthorsController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_author, only: [ :show, :update, :destroy ]

  def index
    @authors = Author.all
    json_response(@authors)
  end

  def create
    @author = Author.create!(author_params)
    json_response(@author, :create)
  end 

  def show
    json_response(@author)
  end

  def update
    @author.update(author_params)
    head :no_content
  end

  def destroy
    @author.destroy
    head :no_content
  end

  private

  def author_params
    params.permit(:first_name, :last_name, :age, :nationality, :published_book)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
