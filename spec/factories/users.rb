FactoryBot.define do
  factory :user do
    _account = Faker::Internet.username

    sequence(:account) { |n| "#{n}_#{_account}" }
    sequence(:email) { |n| Faker::Internet.email("#{n}_#{_account}") }
    name { Faker::Games::SuperSmashBros.fighter }
  end
end
