source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'webpacker'
gem 'jbuilder'
gem 'redis'
gem 'bcrypt'
gem 'jwt'
gem 'dotenv-rails'
gem 'friendly_id'
gem 'mini_magick'
gem 'bootsnap', require: false
gem 'foreman'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
