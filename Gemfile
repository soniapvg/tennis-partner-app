source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.7"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
# gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "sassc-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# Liste de nos gems personnalisés !
gem 'faker'
gem 'devise'
gem 'dotenv-rails'
# gem 'ransack'
# gem 'rspec'
# gem 'table_print'
# gem 'stripe', "~> 5.53"
# gem "aws-sdk-s3"

group :development do
  gem 'letter_opener'
  # gem 'better_errors'
  # gem 'binding_of_caller'
end
