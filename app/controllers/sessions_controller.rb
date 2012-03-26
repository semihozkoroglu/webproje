class SessionsController < ApplicationController

	def index
		@m = "Message"
	end
	def create
		auth = request.env["omniauth.auth"]

		user = Kul.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Kul.create_with_omniauth(auth)
		session[:user_id] = user.id
		redirect_to '/sessions/index'
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Signed out!"
	end
end
