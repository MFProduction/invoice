class MembersController < ApplicationController
  #before_action :set_analytic, only: [:edit, :update]


  def index
    authorize! :read, @members
    @org = Organization.find(params[:organization_id])
    @members = @org.users.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end

   def new
    authorize! :create, @member
    #binding.pry    
    @org = Organization.find(params[:organization_id])  
    @org_member = OrganizationUser.new
  
  end

  def create
    authorize! :create, @member
     #binding.pry    
    @org = Organization.find(params[:organization_id])  
    @org_member = OrganizationUser.new(member_params)
    @org_member.organization_id = @org.id
      if @org_member.save
       flash[:success] = "New member has been added"
       redirect_to organization_members_path
     else 
       render :new
     end
  end

  def destroy
    @org = Organization.find(params[:organization_id])
    @user = User.find(params[:user_id])
    @org_members = OrganizationUser.where(user_id: @user.id, organization_id: @org.id)
    if !@user.has_role? :admin
      @org_members.each do |org_member|  
        org_member.destroy
      end
      flash[:success] = "User is no longer in the organization"
      redirect_to organization_members_path(@org)
    else
      flash[:warning] = "User is Admin and can't be deleted"
      redirect_to organization_members_path(@org)
    end
  end

  def addOrgAdmin 
    @user = User.find(params[:user_id])
    @user.add_role :orgAdmin
    if @user.has_role? :orgAdmin
      flash[:success] = "User is now org Admin"
      redirect_to organization_members_path(@org)

    end

  end

  private
    def member_params 
        params.require(:organization_user).permit(:user_id, :organization_id)
      end
end