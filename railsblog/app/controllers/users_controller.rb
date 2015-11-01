class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show, :destroy]
	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end

	def edit
	end

	def destroy
		if session[:id] == @user.id
		   	session[:id] = nil
			@user = User.find(params[:id]).destroy
			redirect_to users_path, notice: "User was deleted!"
		else
			redirect_to users_path, notice: "User cannot be deleted."
		end
	end

	def update
		@user.update(userparams)
		redirect_to users_path
	end

	def create
		@user = User.new(userparams)
		if @user.save
			flash[:notice] = "User created successfully!"
		else
			flash[:alert] = "User was not created successfully."

		end
			redirect_to users_path
	end

	private

	def userparams
		params.require(:user).permit(:username, :fname, :lname, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end
	

end