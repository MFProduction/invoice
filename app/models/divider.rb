class Divider < ActiveRecord::Base
  resourcify
  belongs_to :invoice
  belongs_to :user
  belongs_to :analytic

  validates :invoice_id, :presence => true
  validates :user_id, :presence => true
  validates :analytic_id, :presence => true
  validates :amount_cents, :presence => true
  

  


end