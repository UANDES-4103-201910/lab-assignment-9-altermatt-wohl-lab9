class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def index

  end


  def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit( :name, :last_name, :phone, :address, :email, :password, :remember_me) }
	devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit( :email, :password, :remember_me) }
	#devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :name, :last_name, :phone, :address, :email, :password, :remember_me) }
  end

  def is_user_logged_in?
	#complete this method
  	logged_in = false
	if logged_in then true else redirect_to root_path end 
  end
end
