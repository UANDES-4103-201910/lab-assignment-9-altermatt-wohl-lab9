class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		redirect_to logged_in_url
	end

	def destroy
		#complete this method
		redirect_to logged_out_url
	end

	def logged_in_url
		url= "users#show"
	end
end
