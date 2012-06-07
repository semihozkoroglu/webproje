class ApplicationController < ActionController::Base
  protect_from_forgery

	helper_method :current_user

	private

	def current_user
	  	if session[:user_id]
				@current_user = User.find(session[:user_id])
			end
			if session[:sirket_id]
		  	@current_user = Sirket.find(session[:sirket_id])
			end
			if session[:admin_id]
		  	@current_user = Admin.find(session[:admin_id])
			end
			return @current_user
	end
end
