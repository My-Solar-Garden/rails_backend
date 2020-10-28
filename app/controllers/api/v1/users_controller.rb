class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end

  def create
    render json: UserSerializer.new(User.create(user_params))
  end

  def update
    render json: UserSerializer.new(User.update(params[:id], user_params))
  end

  def destroy
    User.destroy(params[:id])
  end

  private

  def user_params
    params.permit(:email, :provider, :token, :refresh_token)
  end
end
