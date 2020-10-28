class Api::V1::UsersController < ApplicationController
  def index
    return nil if User.all.empty?
    render json: UserSerializer.new(User.all)
  end

  def show
    return nil if !User.exist?(params[:id])
    render json: UserSerializer.new(User.find(params[:id]))
  end

  def create
    user = User.new(user_params)
    return nil if !user.save
    render json: UserSerializer.new(user)
  end

  def update
    return nil if !User.exist?(params[:id])
    render json: UserSerializer.new(User.update(params[:id], user_params))
  end

  def destroy
    return nil if !User.exist?(params[:id])
    User.destroy(params[:id])
  end

  private

  def user_params
    params.permit(:email, :provider, :token, :refresh_token)
  end
end
