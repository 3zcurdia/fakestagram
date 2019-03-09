# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'pg', '>= 0.18', '< 2.0'
gem 'rails', '~> 6.0.0.beta2'

gem 'aws-sdk-s3', require: false
gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 3.11'

# gem 'redis', '~> 4.0' # Use Redis adapter to run Action Cable in production
# gem 'bcrypt', '~> 3.1.7' # Use Active Model has_secure_password

gem 'bootsnap', '>= 1.4.1', require: false
gem 'image_processing', '~> 1.2'
gem 'oj'
gem 'oj_mimic_json'
gem 'rack-cors'

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
