class Organization < ActiveRecord::Base 
  resourcify
  after_create :create_tenant
  #has_many :costcenters
	#has_many :invoices
  has_many :organization_users
  has_many :users, through: :organization_users 

	validates :name, presence: true, length: { minimum: 3, maximum: 20 }

  private
    def create_tenant
      Apartment::Tenant.create(name)
      #Apartment::Tenant.switch!(name)
    end
end