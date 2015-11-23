FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password { Devise.friendly_token.first(8) }
  end
end

# FactoryGirl.define do
#   factory :user do
#     email "john.doe@jd.com"
#     password "password"
#   end
# end