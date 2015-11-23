FactoryGirl.define do
  factory :invoice do
    number 123456
    supplier "Matej Ferenc s.p."
    taxCode "SI45684858"
    paymentDate "2015-11-23"
    receiptDate "2015-11-23"
    amount_cents 8099
    organization_id 1
    analytic_id 1
    costcenter_id 1
      
  end
end

