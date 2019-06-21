class GenresController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :authenticate_user, only: [:create, :update, :destroy ]
  before_action :set_genre, only: [ :show, :update, :destroy ]

  def index
    @genres = Genre.all
    json_response(@genres)
  end

  def create
    @genre = Genre.create!(genre_params)
    json_response(@genre, :create)
  end

  def show
    json_response(@genre)
  end

  def update
    @genre.update(genre_params)
    head :no_content
  end

  def destroy
    @genre.destroy
    head :no_content
  end

  private

  def genre_params
    params.permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end
end
