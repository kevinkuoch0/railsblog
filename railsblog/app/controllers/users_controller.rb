class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show]
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user.update(params[:user])
		redirect_to @user
	end

	private

	def set_user
		@user = User.find(params[:id])
	end
	

end