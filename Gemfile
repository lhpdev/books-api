source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.4', '>= 5.2.4.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

group :development, :test do
  gem 'rspec-rails', '~> 4.0'
  gem 'factory_bot_rails'
  gem 'byebug', '~> 11.1', '>= 11.1.1'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.4'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'database_cleaner'
end

gem 'interactor', '~> 3.1', '>= 3.1.1'
