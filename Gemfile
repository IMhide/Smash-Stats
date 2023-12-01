source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'
gem 'rails', '~> 7.1.2'
gem 'sprockets-rails'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'redis', '~> 4.0'
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
group :development, :test do
  gem 'brakeman'
  gem 'bundle-audit'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'debride'
  gem 'factory_bot_rails'
  gem 'overcommit', require: false
  gem 'pry-rails'
  gem 'rails_best_practices'
  gem 'reek'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-performance'
  gem 'rubocop-rspec'
  gem 'standard'
  gem 'rubycritic', require: false
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'faker', '~> 2.18'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'rspec'
  gem 'rspec-json_expectations', '~> 2.2'
  gem 'selenium-webdriver'
  gem 'webmock'
  gem 'webdrivers'
end
gem 'image_processing', '~> 1.2'
