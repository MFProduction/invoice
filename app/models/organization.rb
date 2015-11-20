class Organization < ActiveRecord::Base 
  resourcify
  after_create :create_tenant
  after_create :change_tenant
  #has_many :costcenters
	#has_many :invoices
  has_many :organization_users
  has_many :users, through: :organization_users 

	validates :name, presence: true, length: { minimum: 3, maximum: 20 }

  private
    def create_tenant
      Apartment::Tenant.create(name)
    end
    def change_tenant
        
    end
end