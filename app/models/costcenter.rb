class Costcenter < ActiveRecord::Base
	resourcify
  belongs_to :organization
  has_many :invoices

	#validates :invoice_id, presence: true
	validates :name, presence: true, length: { minimum: 3, maximum: 50 }
	validates :number, presence: true, length: { is: 6 }

end