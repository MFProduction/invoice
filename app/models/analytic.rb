class Analytic < ActiveRecord::Base
	resourcify
  has_many :invoices

	#validates :invoice_id, presence: true
	validates :name, presence: true, length: { minimum: 3, maximum: 50 }
	validates :number, presence: true, length: { minimum: 3, maximum: 4 }

end