require "test_helper"

class InvoicesTest < ActiveSupport::TestCase
  def setup
    @org = Organization.create(name:"Zavod 123")
    amount = Money.new(15000)
    @invoice = @org.invoices.build(supplier:"zavod-bob d.o.o", receiptDate: "2015-7-02", paymentDate: "2015-10-02", number: "160/02001964", amount: amount, taxCode:"SI33065888")
  end

  test "invoice sould be valid" do
  	assert @invoice.valid?
  end

  test "organization_id sould be present" do
    @invoice.organization_id= nil
    assert_not @invoice.valid?
  end
  
  test "supplier sould be present" do
    @invoice.supplier = " "
    assert_not @invoice.valid?
  end

  test "supplier sould not be shorter than 3" do
    @invoice.supplier = "ba"
    assert_not @invoice.valid?
  end

  test "supplier sould not be longer than 25" do
    @invoice.supplier = "a" *24
    assert_not @invoice.valid?
  end

  test "receiptDate sould be present" do
    @invoice.receiptDate = " "
    assert_not @invoice.valid?
  end

 test "paymentDate sould be present" do
    @invoice.paymentDate = " "
    assert_not @invoice.valid?
  end 
  #TODO: validate dates payment can't be older than receipt

  test "Number sould be present" do
    @invoice.number = " "
    assert_not @invoice.valid?
  end

  test "amount sould be present" do
    @invoice.amount = nil
    assert_not @invoice.valid?
  end

   test "taxCode sould be present" do
    @invoice.taxCode = " "
    assert_not @invoice.valid?
  end

  test "taxCode sould be be valid" do
    valid_taxCode = %w[SI33065888 SI33068786]
    valid_taxCode.each do |val|
      @invoice.taxCode = val
      assert @invoice.valid?, "#{val.inspect} sould be valid"
    end
  end

  test "taxCode validations sould be invalid" do
    invalid_taxCode = %w[SI330658881 SI3306588]
    invalid_taxCode.each do |ia| 
      @invoice.taxCode = ia
      assert_not @invoice.valid?, "#{ia.inspect} sould be invalid"
    end
  end





end