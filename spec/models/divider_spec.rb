require 'rails_helper'

describe Divider do
   describe "validations" do
    it { should validate_presence_of :amount_cents }

  end
  describe "associations" do
    it { should belong_to(:invoice)}
    it { should validate_presence_of :invoice_id }

    it { should belong_to(:user)}
    it { should validate_presence_of :user_id }
    
    it { should belong_to(:analytic)}
    it { should validate_presence_of :analytic_id }
  end
end