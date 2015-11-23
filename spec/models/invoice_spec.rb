require 'rails_helper'

RSpec.describe Invoice, type: :model do
  
  before(:all)do
    amount = Money.new(15000)
    @invoice = Invoice.create (supplier:"zavod-bob d.o.o", receiptDate: "2015-7-02", paymentDate: "2015-10-02", number: "160/02001964", amount_cents: amount, taxCode:"SI33065888")
  end

  it "should have a matching supp" do
    expect(@invoice).to eq('zavod-bob d.o.o') 
  end


end
