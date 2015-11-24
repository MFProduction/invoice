require 'rails_helper'

describe Invoice do
  describe "validations" do 
    it { should validate_presence_of :supplier }
    it { should ensure_length_of(:supplier).is_at_least(3).is_at_most(20) }

    it { should validate_presence_of :paymentDate }
    
    it { should validate_presence_of :receiptDate }
    
    it { should validate_presence_of :number }
    
    it { should validate_presence_of :amount_cents }
    
    it { should validate_presence_of :taxCode }
    it { should ensure_length_of(:taxCode).is_equal_to(10) }
  
  end

  describe "associations" do
    it { should belong_to(:organization) }
    #it { should validate_presence_of :organization_id }
    
    it { should belong_to(:costcenter) }
    it { should validate_presence_of(:costcenter_id) }
        
    it { should belong_to(:analytic) }
    it { should validate_presence_of :analytic_id }
    
    it { should have_many(:dividers) }
    it { should have_many(:users).through(:dividers) }
  end  
end