source :rubygems

gem 'rails'

gem 'heroku'
gem 'jquery-rails'
gem 'newrelic_rpm'
gem 'rake'
gem 'slim-rails'
gem 'thin'

group :assets do
  gem 'bourbon'
  gem 'coffee-rails'
  gem 'sass-rails'
  gem 'uglifier'
end

group :production do
  gem 'dalli'
  gem 'pg'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'

  group :guard do
    gem 'guard-cucumber'
    gem 'guard-rspec'

    group :darwin do
      gem 'rb-fsevent'
      gem 'growl'
    end
  end
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  #gem 'fabricator'
  gem 'fivemat'
  gem 'simplecov'
  #gem 'timecop'
  gem 'turnip'
  #gem 'vcr'
end

