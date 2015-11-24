class OrganizationsController < ApplicationController
	before_action :set_org, only: [:show,:edit, :update]

	def index
  @user = current_user
		@orgs = Organization.all
    #authorize! :read, @orgs
		#render :json => @orgs
	end

	def new 
    #authorize! :create, @org
  	@org = Organization.new
  end
  
  def create
    user = current_user
    #authorize! :create, @org
    @org = Organization.new(org_params)
    #user.add_role :orgAdmin
    #@org.users << user    
    if @org.save
      flash[:success] = "Organization has been created"
      redirect_to organizations_path

    else 
      render :new
    end
  end

  def edit
    #authorize! :edit, @org 
  end

  def update
    #authorize! :edit, @org
    if @org.update(org_params)
      flash[:success] = "Your organization was updated succesfully"
      redirect_to root_path
    else 
      render :edit
    end 
  end

  def destroy
    #authorize! :delete, @org
    Organization.find(params[:id]).destroy
    flash[:success] = "Organization was successfuly deleted"
    redirect_to organizations_path
  end


	private
		def org_params 
	   		params.require(:organization).permit(:name, schema_name)
    	end

    	def set_org
      		@org = Organization.find(params[:id])
    	end 
       
       # THIS
        def set_headers
          headers['X-FUCKYPU'] = 'Too'
          
        end 
end