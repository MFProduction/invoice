class OrganizationsController < ApplicationController
	before_action :set_org, only: [:show,:edit, :update]


	def index
    authorize! :read, @org
		@orgs = Organization.all
		#render :json => @orgs
	end

  def show
    authorize! :read, @org
    @invoices = @org.invoices.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

	def new
    authorize! :crate, @org
  	@org = Organization.new
  end
  
  def create
    authorize! :create, @org
    @org = Organization.new(org_params)
      
    if @org.save
      flash[:success] = "Organization has been created"
      redirect_to root_path
    else 
      render :new
    end
  end

  def edit
    authorize! :edit, @org 
  end

  def update
    authorize! :edit, @org
    if @org.update(org_params)
      flash[:success] = "Your organization was updated succesfully"
      redirect_to root_path
    else 
      render :edit
    end 
  end


	private
		def org_params 
	   		params.require(:organization).permit(:name)
    	end

    	def set_org
      		@org = Organization.find(params[:id])
    	end  
end