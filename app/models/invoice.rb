class Invoice < ActiveRecord::Base
	resourcify
	belongs_to :organization
	belongs_to :analytic
	belongs_to :costcenter
	has_many :dividers
	has_many :users, through: :dividers

	
	#validates :organization_id, presence: true
	validates :costcenter_id, presence: {message: 'Cost center is required. Create first one to continue!'}
	validates :analytic_id, presence: { message: 'Analytic is required' }
	validates :supplier, presence: true, length: { minimum: 3, maximum: 20 }
	validates :paymentDate, presence: true
	validates :receiptDate, presence: true
	validates :number, presence: true
	validates :amount_cents, presence: true
	validates :taxCode, presence: true, length: { is: 10 }

end