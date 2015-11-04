class Invoice < ActiveRecord::Base
	resourcify
	belongs_to :organization
	belongs_to :analytic
	belongs_to :costbreakdown


	validates :organization_id, presence: true
	validates :supplier, presence: true, length: { minimum: 3, maximum: 20 }
	validates :paymentDate, presence: true
	validates :receiptDate, presence: true
	validates :number, presence: true
	validates :amount, presence: true
	validates :taxCode, presence: true, length: { is: 10 }

end