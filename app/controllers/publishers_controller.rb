class PublishersController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_publisher, only: [ :show, :update, :destroy]
  def index
    @publishers = Publisher.all
    json_response(@publishers)
  end

  def create
    @publisher = Publisher.create!(publisher_params)
    json_response(@publisher)
  end

  def show
    json_response(@publisher)
  end

  def update
    @publisher.update(publisher_params)
    head :no_content
  end

  def destroy
    @publisher.destroy
    head :no_content
  end

  private

  def publisher_params
    params.permit(:name, :foundation, :country)
  end

  def set_publisher
    @publisher = Publisher.find(params[:id])
  end
end
