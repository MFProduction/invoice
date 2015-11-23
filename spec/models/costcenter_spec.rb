require 'rails_helper'

describe Costcenter do
  describe "validates" do
    it { should validate_presence_of :name }
    it { should ensure_length_of(:name).is_at_least(3).is_at_most(50) }
    
    it { should validate_presence_of :number }
    it { should ensure_length_of(:number).is_equal_to(6) }
    it { should allow_value('123456').for :number }
    it { should_not allow_value("44443d").for :number }
    it { should_not allow_value("4442/5").for :number }

  end

  describe "associations" do
    it { should have_many(:invoices)}
    it { should belong_to(:organization)}
  end  
end