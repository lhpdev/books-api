source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.2'

# Database
gem 'pg', '>= 0.18', '< 2.0'

# server
gem 'puma', '~> 3.11'

# API
gem 'active_model_serializers'
gem 'friendly_id'

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
  gem 'rspec-json_expectations'
end
