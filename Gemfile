source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"

gem "mysql2"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.2", ">= 5.2.2.1"
gem "sass-rails", "~> 5.0", ">= 5.0.7"
gem "uglifier", ">= 1.3.0"

gem "coffee-rails", "~> 4.2", ">= 4.2.2"
gem "jbuilder", "~> 2.5"
gem "turbolinks", "~> 5"

gem "bootsnap", ">= 1.1.0", require: false
gem "webpacker", github: "rails/webpacker"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails", ">= 5.0.1"
  gem "faker"
  gem "onkcop", require: true
  gem "pry-byebug"
  gem "pry-doc"
  gem "pry-rails"
  gem "rspec-rails", ">= 3.8.2"
  gem "rspec_junit_formatter"
  gem "rubocop-performance"
end

group :development do
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-bundler", "~> 1.5"
  gem "capistrano-database-yml", "~> 1.0.0"
  gem "capistrano-rails", "~> 1.4", require: false
  gem "capistrano-rbenv", "~> 2.1"
  gem "capistrano3-unicorn"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.7.0"
end

group :test do
  gem "capybara", ">= 3.15.0"
  gem "chromedriver-helper", ">= 2.1.0"
  gem "selenium-webdriver"
end

group :production do
  gem "mini_racer", platforms: :ruby
  gem "unicorn"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
