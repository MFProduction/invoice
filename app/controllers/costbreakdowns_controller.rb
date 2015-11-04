class CostbreakdownsController < ApplicationController
	before_action :set_costBreakdown, only: [:edit, :update]


	def index
    authorize! :read, @costbreakdown
		@costbreakdowns = Costbreakdown.paginate(page: params[:page], per_page: 5).order('created_at DESC')
   # @value = Money.new(@CostBreakdowns.first.amount)
		#render :json => @orgs
	end

	def new
      authorize! :create, @costbreakdown
  		@costbreakdown = Costbreakdown.new
  	end
  
  def create
  	#binding.pry    
    authorize! :create, @costbreakdown
    @costbreakdown = Costbreakdown.new(costBreakdown_params)
    
    if @costbreakdown.save
      flash[:success] = "New CostBreakdown category has been created"
      redirect_to costbreakdowns_path
    else 
      render :new
    end
  end
	

	private
		def costBreakdown_params 
	   		params.require(:costbreakdown).permit(:name, :number)
    	end

    	def set_CostBreakdown
      		@costbreakdown = CostBreakdown.find(params[:id])
    	end  
end