# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'pg', '>= 0.18', '< 2.0'
gem 'rails', '~> 6.1.1'

gem 'activerecord-postgis-adapter'
gem 'carrierwave', '~> 2.0'
gem 'carrierwave-aws'
gem 'dalli'
gem 'jbuilder', '~> 2.11'
gem 'puma', '~> 5.1'

# gem 'redis', '~> 4.0' # Use Redis adapter to run Action Cable in production
gem 'bcrypt', '~> 3.1.16' # Use Active Model has_secure_password

gem 'bootsnap', '>= 1.4.1', require: false
gem 'faker'
gem 'jwt'
gem 'kaminari'
gem 'mime-types', require: 'mime/types/full'
gem 'mini_magick'
gem 'oj'
gem 'pundit'
gem 'rack-cors'

group :development, :test do
  gem 'bullet'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
