class AnalyticsController < ApplicationController
	before_action :set_analytic, only: [:edit, :update]


	def index
    authorize! :read, @analytics
		@analytics = Analytic.paginate(page: params[:page], per_page: 20).order('created_at DESC')
   # @value = Money.new(@analytics.first.amount)
		#render :json => @orgs
	end

	def new
    authorize! :create, @analytics
  		@analytic = Analytic.new
  	end
  
  def create
    authorize! :create, @analytics
  	#binding.pry    
    @analytic = Analytic.new(analytic_params)
    
    if @analytic.save
      flash[:success] = "New analytic has been created"
      redirect_to analytics_path
    else 
      render :new
    end
  end
	

	private
		def analytic_params 
	   		params.require(:analytic).permit(:name, :number)
    	end

    	def set_analytic
      		@analytic = analytic.find(params[:id])
    	end  
end