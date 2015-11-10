class MembersController < ApplicationController
  #before_action :set_analytic, only: [:edit, :update]


  def index
    authorize! :read, @members
    @org = Organization.find(params[:organization_id])
    @members = @org.users.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end

  # def add
  #   authorize! :create, @member
  #   binding.pry    
  #   @org = Organization.find(params[:organization_id])
    
  #   @member = User.find(params[:user_id])
  #   if @analytic.save
  #     flash[:success] = "New analytic has been created"
  #     redirect_to analytics_path
  #   else 
  #     render :new
  #   end
  # end
  

  # private
  #   def analytic_params 
  #       params.require(:analytic).permit(:name, :number)
  #     end

  #     def set_analytic
  #         @analytic = analytic.find(params[:id])
  #     end  
end