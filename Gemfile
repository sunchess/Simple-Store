source 'http://rubygems.org'

gem 'rails', '3.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'right-rails'
gem "cancan"
#gem "authlogic"
gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3' 
gem "will_paginate", "~> 3.0.pre2"



group :test do
  # RSpec
  gem 'rspec', (RSPEC_VERSION = '~> 2.0.0.beta')
  gem 'rspec-core', RSPEC_VERSION, :require => 'rspec/core'
  gem 'rspec-expectations', RSPEC_VERSION, :require => 'rspec/expectations'
  gem 'rspec-mocks', RSPEC_VERSION, :require => 'rspec/mocks'
  gem 'rspec-rails', RSPEC_VERSION
  gem "autotest"
  # Cucumber
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'spork' unless RUBY_PLATFORM =~ /mswin|mingw/
  gem 'launchy'
  gem 'gherkin'
  gem 'factory_girl_rails'
  #gem 'webrat' #It still not works with Rails 3.
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:


