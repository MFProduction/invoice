class Divider < ActiveRecord::Base
  resourcify
  belongs_to :invoice
  belongs_to :user
  belongs_to :analytic

  

  


end