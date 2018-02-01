class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?










protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:username,
  		:email, :image, :password, :confirm_password, :remember_me, 
  		:image_cache)}

  	devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:username,
  		:email, :image, :password, :confirm_password, :current_password, 
  		:image_cache, :remove_image)}

  	devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:login, :password)}
  end	
end
