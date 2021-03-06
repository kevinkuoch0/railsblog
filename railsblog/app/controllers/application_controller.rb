class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

	def current_user
		session[:id] ? User.find(session[:id]) : nil
	end

end
