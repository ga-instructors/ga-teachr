source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'
# gem 'unicorn-rails'
gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'pundit'
gem 'omniauth-github'
gem "octokit", "~> 4.0"
gem 'redcarpet'
gem 'csv_shaper'
gem 'pygments.rb'
gem 'deep_cloneable'
gem 'database_cleaner'
gem 'figaro'
gem 'react-rails'
gem 'ansi' # for installfest-scripting
gem 'mini_magick'
gem 'redis-rails'

source 'https://rails-assets.org' do
  gem 'rails-assets-velocity'
end

group :development, :test do
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'poltergeist'
  gem 'ffaker'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'puffing-billy'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'quiet_assets'
  
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
