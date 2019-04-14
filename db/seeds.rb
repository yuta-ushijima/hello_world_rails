p "===================="
p "Starting Seeding..."
10.times do |n|
  user = User.create!(account: "#{Faker::Internet.username}" "_#{rand(1..20)}",
                      name: Faker::Games::SuperSmashBros.fighter,
                      email: Faker::Internet.email(n.to_s))

  5.times do
    user.articles.create!(title: Faker::Markdown.headers,
                          body: Faker::Markdown.emphasis,
                          post_status: :published)
  end

  5.times do
    user.articles.create!(title: Faker::Markdown.headers,
                          body: Faker::Markdown.emphasis,
                          post_status: :draft)
  end
end
p "Complete Seeding!"
p "===================="
