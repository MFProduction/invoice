class Organization < ActiveRecord::Base 
  resourcify
	has_many :invoices

	validates :name, presence: true, length: { minimum: 3, maximum: 20 }
end