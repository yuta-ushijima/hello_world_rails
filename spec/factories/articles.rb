FactoryBot.define do
  factory :article do
    title { Faker::Markdown.headers }
    body { Faker::Markdown.emphasis }
    post_status { 0 }
    user
  end
end
