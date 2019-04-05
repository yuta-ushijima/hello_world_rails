FactoryBot.define do
  factory :user_detail do
    postal_code { Faker::Address.postcode }
    address { Faker::Address.city }
    birthday { 20.years.ago }
    user
  end
end
