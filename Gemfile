# frozen_string_literal: true

# Gemfile, gem installed.
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.2.3'
gem 'sqlite3'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner', '~> 1.7.0'
  gem 'shoulda-matchers', '~> 4.0.1'
  gem 'faker'
  gem 'rspec-rails', '~> 3.8.2'
  gem 'factory_bot_rails', '~> 5.0.2'
end