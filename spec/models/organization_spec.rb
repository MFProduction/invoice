require 'rails_helper'

describe Organization do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of :schema_name}
    it { should validate_uniqueness_of :schema_name}

    it { should allow_value('zavod_bob').for(:schema_name) }
    it { should allow_value('test').for(:schema_name) }
    it { should allow_value('matejferenc').for(:schema_name) }
    it { should allow_value('zavod 123').for(:schema_name) }

    
    it { should_not allow_value('api').for(:schema_name) }
    it {should_not allow_value('www').for(:schema_name) }
    it {should_not allow_value('WWW').for(:schema_name) } 
    it {should_not allow_value('.test').for(:schema_name) }
    it {should_not allow_value('test/').for(:schema_name) }

    it 'should validate case insensitive uniqueness' do
      create(:organization, schema_name: 'TestA')
      expect(build(:organization, schema_name: 'testa')).to_not be_valid
    end
  end
    
  describe 'associations' do
    it { should have_many(:users).through(:members) }
    it { should have_many(:members) }
    it { should have_many(:invoices) }
    it { should have_many(:costcenters) }
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
