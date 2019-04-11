FactoryBot.define do
  factory :article do
    title { Faker::Markdown.headers }
    body { Faker::Markdown.emphasis }
    post_status { Article.post_statuses[:draft] }
    user
  end
end
