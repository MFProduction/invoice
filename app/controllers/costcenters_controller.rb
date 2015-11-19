class CostcentersController < ApplicationController
	before_action :set_costcenter, only: [:edit, :update]


	def index
    #authorize! :read, @costcenter
    #@org = Organization.find(params[:organization_id])
		@costcenters = Costcenter.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    #@value = Money.new(@costcenters.first.amount)
		#render :json => @orgs
	end

	def new
    #@org = Organization.find(params[:organization_id])
    #authorize! :create, @costcenter
  	@costcenter = Costcenter.new
  	end
  
  def create
  	#binding.pry   
    #authorize! :create, @costcenter
    #@org = Organization.find(params[:organization_id])
    @costcenter = Costcenter.new(costcenter_params)
    #@costcenter.organization_id = @org.id
    
    if @costcenter.save
      flash[:success] = "New costcenter category has been created"
      redirect_to costcenters_path
    else 
      render :new
    end
  end
	

	private
		def costcenter_params 
	   		params.require(:costcenter).permit(:name, :number, :organization_id)
    	end

    	def set_costcenter
      		@costcenter = Costcenter.find(params[:id])
    	end  
end