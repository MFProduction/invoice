class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
    
  end

  def is_orgAdmin? 
    return  
  end
    
  def redirect_back_or_root
    redirect_to :back 
    rescue ActionController::RedirectBackError
      redirect_to root_path
  end

  def require_organization
    if response.headers['Xxx'].present?
      @org = Organization.find(1)
      Apartment::Tenant.switch!(@org.name)
      #@organization = current_user.organizations.find hashid_decode(request.headers['Http_x_organization'])
      #Apartment::Tenant.switch! @organization.name
    #else
    #  flash[:warrning] = "no header org"
    end
  end

end
