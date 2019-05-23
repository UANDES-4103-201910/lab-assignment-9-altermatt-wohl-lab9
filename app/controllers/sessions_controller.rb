class SessionsController < ApplicationController
	def new
		if current_user
			redirect_to current_user
		end
	end

	def create
		user = User.find(user_params)
		if user.save?
			session[:current_user_id] = user.id
			flash[:notice] =  'You have successfully logged_in'
			redirect_to user
		else
			flash[:error] = errors.details
			redirect_to root_path
		end
		#complete this method

	end

	def destroy
		#complete this method
		session[:current_user_id] = nil
		current_user = session[:current_user_id]
		flash[:notice] = 'You are logged ot'
		redirect_to root_path
	end


	def user_params
		params.require(:session).permit(:email, :password)
	end
end
