class UsersController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_user, only: [ :show, :update, :destroy]
  def index
    @users = User.all
    json_response(@users)

  end

  def create
    @user = User.create!(params_user)
    json_response(@user)
  end

  def show
    json_response(@user)
  end

  def show
    json_response(@user)
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def params_user
    params.permit(:first_name, :last_name, :email, :password)
  end

  def set_user
    @user = user.find(params[:id])
  end
end
