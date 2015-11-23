require 'rails_helper'

describe Analytic do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should ensure_length_of(:name).is_at_least(3).is_at_most(50) }
    
    it { should validate_presence_of :number }
    it { should ensure_length_of(:number).is_at_least(3).is_at_most(4) }
    it { should allow_value('1234').for :number }
    it { should_not allow_value("43d").for :number }
    it { should_not allow_value("42/5").for :number }
  end
  describe "associations" do
    it { should have_many :invoices }
  end  
end