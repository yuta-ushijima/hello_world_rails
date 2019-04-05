FactoryBot.define do
  factory :user do
    _account = Faker::Internet.username

    sequence(:account) { |n| "#{n}_#{_account}" }
    sequence(:email) { |n| Faker::Internet.email("#{n}_#{_account}") }
    name { Faker::Games::SuperSmashBros.fighter }

    trait :with_user_detail do
      # association :user_detail, factory: :user_detailと同義
      user_detail
    end
  end
end
