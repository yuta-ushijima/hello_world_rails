source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"

gem "mysql2"
gem "puma", "~> 3.11"
gem "rails", "~> 7.1.0"
gem "sass-rails", "~> 6.0", ">= 6.0.0"
gem "uglifier", ">= 1.3.0"

gem "coffee-rails", "~> 5.0", ">= 5.0.0"
gem "jbuilder", "~> 2.9", ">= 2.9.0"
gem "turbolinks", "~> 5"

gem "bootsnap", ">= 1.1.0", require: false
gem "webpacker", github: "rails/webpacker"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails", ">= 5.0.2"
  gem "faker"
  gem "onkcop", require: true
  gem "pry-byebug"
  gem "pry-doc", ">= 1.1.0"
  gem "pry-rails"
  gem "rspec-rails", ">= 3.8.3"
  gem "rspec_junit_formatter"
  gem "rubocop-performance"
end

group :development do
  gem "capistrano", "~> 3.11", ">= 3.11.1", require: false
  gem "capistrano-bundler", "~> 1.6", ">= 1.6.0"
  gem "capistrano-database-yml", "~> 1.0.0"
  gem "capistrano-rails", "~> 1.5", ">= 1.5.0", require: false
  gem "capistrano-rbenv", "~> 2.1", ">= 2.1.5"
  gem "capistrano3-unicorn"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 4.0.0"
end

group :test do
  gem "capybara", ">= 3.15.1"
  gem "chromedriver-helper", ">= 2.1.1"
  gem "selenium-webdriver", ">= 3.141.592"
end

group :production do
  gem "mini_racer", platforms: :ruby
  gem "unicorn"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
