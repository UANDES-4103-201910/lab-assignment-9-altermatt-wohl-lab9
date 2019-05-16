class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
		#@uid = User.last.uid + 1
		#@user = User.create(uid: @uid, user_params)
		#respond_to do |format|		
		#	if @user.save			
		#		redirect_to "/", notice: 'Successful registration'
		#	else
		#		redirect_to registrations_url, notice: @user.errors.messages
		#	end
		#end 
	end
	
	def user_params		
		params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end
end
