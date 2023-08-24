source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"

gem "mysql2"
gem "puma", "~> 3.11"
gem "rails", "~> 6.1.7", ">= 6.1.7.5"
gem "sass-rails", "~> 5.0", ">= 5.0.8"
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
  gem "pry-doc"
  gem "pry-rails"
  gem "rspec-rails", ">= 3.8.3"
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
  gem "spring", ">= 2.1.0"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 4.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
end

group :production do
  gem "mini_racer", platforms: :ruby
  gem "unicorn"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
