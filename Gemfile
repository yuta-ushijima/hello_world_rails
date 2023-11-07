source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"

gem "mysql2"
gem "puma", "~> 4.3", ">= 4.3.12"
gem "rails", "~> 6.1.7", ">= 6.1.7.3"
gem "sass-rails", "~> 6.0", ">= 6.0.0"
gem "uglifier", ">= 1.3.0"

gem "coffee-rails", "~> 4.2", ">= 4.2.2"
gem "jbuilder", "~> 2.8", ">= 2.8.0"
gem "turbolinks", "~> 5"

gem "bootsnap", ">= 1.1.0", require: false
gem "webpacker", github: "rails/webpacker"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "onkcop", require: true
  gem "pry-byebug"
  gem "pry-doc"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rspec_junit_formatter"
  gem "rubocop-performance"
end

group :development do
  gem "capistrano", "~> 3.11", ">= 3.11.0", require: false
  gem "capistrano-bundler", "~> 1.5", ">= 1.5.0"
  gem "capistrano-database-yml", "~> 1.0.1"
  gem "capistrano-rails", "~> 1.4", ">= 1.4.0", require: false
  gem "capistrano-rbenv", "~> 2.1", ">= 2.1.4"
  gem "capistrano3-unicorn"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.1"
  gem "web-console", ">= 3.7.0"
end

group :test do
  gem "capybara", ">= 3.15.0"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
end

group :production do
  gem "mini_racer", platforms: :ruby
  gem "unicorn"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
