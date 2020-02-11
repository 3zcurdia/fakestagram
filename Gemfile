# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'pg', '>= 0.18', '< 2.0'
gem 'rails', '~> 6.0.2'

gem 'activerecord-postgis-adapter'
gem 'carrierwave', '~> 2.0'
gem 'carrierwave-aws'
gem 'dalli'
gem 'jbuilder', '~> 2.10'
gem 'puma', '~> 4.3'

# gem 'redis', '~> 4.0' # Use Redis adapter to run Action Cable in production
gem 'bcrypt', '~> 3.1.13' # Use Active Model has_secure_password

gem 'bootsnap', '>= 1.4.1', require: false
gem 'faker'
gem 'jwt'
gem 'kaminari'
gem 'mime-types', require: 'mime/types/full'
gem 'mini_magick'
gem 'oj'
gem 'oj_mimic_json'
gem 'pundit'
gem 'rack-cors'

group :development, :test do
  gem 'bullet'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.3'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
