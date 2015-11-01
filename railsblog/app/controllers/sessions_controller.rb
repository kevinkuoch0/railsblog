class SessionsController < ApplicationController

	def login
		@user = User.find_by(username: params[:username])
		if @user and @user.password == params[:password]
			session[:id] = @user.id
			redirect_to user_path(current_user), notice: "Successfully signed in!"
		else
			redirect_to root_path, alert: "Failed to log in."
		end
		
	end

	def logout
		session[:id] = nil
		flash[:notice] = "You have been signed out."
		redirect_to root_path
	end

end