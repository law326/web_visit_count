# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

gem 'activerecord'
gem 'pg'
gem 'standalone_migrations'

group :development, :test do
  gem 'byebug'
  gem 'database_cleaner-active_record'
  gem 'factory_bot'
  gem 'rspec'
  gem 'rubocop', '~> 0.89.0', require: false
end
