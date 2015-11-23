class Costcenter < ActiveRecord::Base
	resourcify
  belongs_to :organization
  has_many :invoices

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
	validates :number, presence: true, 
                     length: { is: 6 },
                     format: { with: /\A[+-]?\d+\z/, message: "Costcenter number can have only numbers" } 

end