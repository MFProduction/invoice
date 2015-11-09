class InvoicesController < ApplicationController
	before_action :set_invoice, only: [:edit, :update]
  before_action :set_org, only: [:index, :new, :create]

	def index
    authorize! :read, @invoice
    @org = Organization.find(params[:organization_id])
		@invoices = @org.invoices.paginate(page: params[:page], per_page: 10).order('created_at DESC')
	end

	def new
    #binding pry
    authorize! :create, @invoice
    @invoice = Invoice.new
  end
  
  def create
    authorize! :create, @invoice
    @invoice = Invoice.new(invoice_params)
    @invoice.organization_id = @org.id
    
    if @invoice.save
      flash[:success] = "Invoice has been created"
      redirect_to organization_invoices_path(@org)
    else 
      render :new
    end
  end

  def edit
    authorize! :edit, @invoice
  end

  def update
    authorize! :edit, @invoice
    @org = @invoice.organization
    if @invoice.update(invoice_params)
      flash[:success] = "Your invoice was updated succesfully"
      redirect_to organization_invoices_path @org 
    else 
      render :edit
    end 
  end

  def destroy
 @invoice = Invoice.find(params[:id]) 
  @org = @invoice.organization
    @invoice.destroy
    flash[:success] = "Invoice deleted"
    redirect_to organization_invoices_path(@org)
  end
	

	private
		def invoice_params 
	   		params.require(:invoice).permit(:supplier, :amount_cents,:taxCode, :number, :paymentDate, :receiptDate, :organization_id, :analytic_id, :costcenter_id)
    	end

    	def set_invoice
      		@invoice = Invoice.find(params[:id])
    	end  
      def set_org 
       @org = Organization.find(params[:organization_id])
      end
end