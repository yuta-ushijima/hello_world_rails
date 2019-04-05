FactoryBot.define do
  factory :user_detail do
    postal_code { Faker::Address.postcode }
    address { Faker::Address.city }
    birthday { 20.years.ago }
    association :user, factory: :user
  end
end
