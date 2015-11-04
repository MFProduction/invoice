class InvoicesController < ApplicationController
	#before_action :set_org, only: [:edit, :update]


	def index
    authorize! :read, @invoice
    @user = current_user
    @org = Organization.find(params[:organization_id])
		@invoices = @org.invoices.paginate(page: params[:page], per_page: 5).order('created_at DESC')
   # @value = Money.new(@invoices.first.amount)
		#render :json => @orgs
	end

	def new
    #binding pry
    authorize! :create, @invoice
    @org = Organization.find(params[:organization_id])
    @invoice = Invoice.new
  end
  
  def create
    authorize! :create, @invoice
  	@org = Organization.find(params[:organization_id])
    @invoice = Invoice.new(invoice_params)
    @invoice.organization_id = @org.id
    
    if @invoice.save
      flash[:success] = "Invoice has been created"
      redirect_to organization_path(@invoice.organization_id)
    else 
      render :new
    end
  end
	

	private
		def invoice_params 
	   		params.require(:invoice).permit(:supplier, :amount,:taxCode, :number, :paymentDate, :receiptDate, :organization_id, :analytic_id, :costbreakdown_id)
    	end

    	def set_invoice
      		@invoice = Invoice.find(params[:id])
    	end  
end