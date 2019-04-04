FactoryBot.define do
  factory :user do
    account { Faker::Internet.user_name }
    email { Faker::Internet.email }
    name { Faker::Games::SuperSmashBros.fighter }
  end
end
