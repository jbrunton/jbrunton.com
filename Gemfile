source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'

# Use sqlite3 for development and testing
group :development, :test do
  gem 'sqlite3'
  gem 'heroku'
end

# Use Postgres on Heroku
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

gem 'foundation-rails'

gem 'devise'
gem 'omniauth-facebook'
gem 'cancan'

gem 'inherited_resources'

# Can't deploy to Heroku using latest Rolify.
# See: http://stackoverflow.com/a/21897887
# Fixed for upcoming 3.5: https://github.com/EppO/rolify/issues/221
gem 'rolify', '~> 3.2.0'

# Serve assets on Heroku.
# See https://devcenter.heroku.com/articles/ruby-support#static-assets
group :production do
  gem 'rails_serve_static_assets'
end

# for test/seed data
gem 'faker'
gem 'timecop'

# markdown and html parsing
gem 'redcarpet'
gem 'nokogiri'

gem 'friendly_id'

group :development, :test do
  gem "heroploy", path: '../heroploy'
end
 
group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

# Send coverage to Coveralls
group :test do
  gem 'coveralls', require: false
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
