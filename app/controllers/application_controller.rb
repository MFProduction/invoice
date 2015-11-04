class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
    
  end
  
  def redirect_back_or_root
    redirect_to :back 
    rescue ActionController::RedirectBackError
      redirect_to root_path
  end
end
