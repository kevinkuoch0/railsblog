class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(params[:user])
    redirect_to @user
  end

  def update
    @user.update(params[:user])
    redirect_to @user
  end

  # def destroy
  #   @user.destroy
  #   redirect_to users_path
  # end

  # def profile
  #   @users = User.where(username: params[:username])
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
