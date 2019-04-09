FactoryBot.define do
  factory :article do
    title { Faker::Markdown.headers }
    body { Faker::Markdown.emphasis }
    user
  end
end
