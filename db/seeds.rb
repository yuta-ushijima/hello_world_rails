p "===================="
p "Starting Seeding..."
10.times do |n|
  user = User.create!(account: "#{Faker::Internet.username}" "_#{rand(1..20)}",
               name: Faker::Games::SuperSmashBros.fighter,
               email: Faker::Internet.email("#{n}"),
  )

  user.articles.create!(title: Faker::Markdown.headers,
                        body: Faker::Markdown.emphasis,
  )
end
p "Complete Seeding!"
p "===================="
