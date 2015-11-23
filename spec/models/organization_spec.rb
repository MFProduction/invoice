require 'rails_helper'

describe Organization do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_uniqueness_of :name}

   # it { should allow_value('Zavod Bob').for(:name) }

   # it {should_not allow_value('www').for(:name) }



  end
end 




# RSpec.describe Organization, type: :model do
  
#   before(:all)do
#     @org = Organization.new(name:"Zavod Bob")
#   end

#   it "should have a matching supp" do
#     expect(@org.name).to eq('Zavod Bob') 
#   end


# end
