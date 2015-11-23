FactoryGirl.define do
  factory :organization do
    name "Zavod Bob"
    schema_name "zavod_bob"
  end
end


# FactoryGirl.define do
#   factory :organization do
#     company = FFaker::Company.name
#     name {company}
#     schema_name {company.downcase.tr(" ", "_")}
#   end
# end