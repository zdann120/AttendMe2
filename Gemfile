source "https://rubygems.org"

# Heroku uses the ruby version to configure your application"s runtime.
ruby "2.5.0"

gem "bootsnap", "~> 1.1", require: false
gem "listen", "~> 3.1"
gem "pg", "~> 1.0"
gem "puma", "~> 3.11"
gem "rack-canonical-host", "~> 0.2"
gem "rails", "5.2.0.rc1"

gem "autoprefixer-rails", "~> 7.2"
gem "bootstrap-sass", "~> 3.3"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails", "~> 4.3"
gem "sass-rails", "~> 5.0"
# gem "sassc-rails"
gem "simple_form", "~> 3.5"
gem "slim-rails", "~> 3.1"
gem "uglifier", "~> 4.1"

gem "awesome_print", "~> 1.8"

group :production, :acceptance do
  gem "rack-timeout", "~> 0.4"
end

group :test do
  gem "capybara", "~> 2.17"
  # gem "capybara-email"
  gem "capybara-selenium", "~> 0.0"
  gem "simplecov", "~> 0.15"
end

group :test, :development do
  gem "factory_bot_rails", "~> 4.8"
  gem "rspec-rails", "~> 3.7"
  gem "rspec_junit_formatter", "~> 0.3"
  gem "rubocop", "~> 0.52", require: false
end

group :development do
  gem "annotate", "~> 2.7"
  gem "better_errors", "~> 2.4"
  gem "binding_of_caller", "~> 0.8"
  gem "dotenv-rails", "~> 2.2"
  gem "launchy", "~> 2.4"
  gem "spring", "~> 2.0"
  gem "spring-commands-rspec", "~> 1.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "letter_opener", "~> 1.6"
  # gem "guard"
  # gem "guard-rspec", ">= 4.6.5" # Resolves to 1.x without a version constraint. :/
  # gem "guard-livereload"
end

gem "active_interaction", "~> 3.6"
gem "money-rails", "~> 1.10"
gem "devise", "~> 4.4"
gem "pundit", "~> 1.1"
gem "flutie", "~> 2.0"
gem "draper", "~> 3.0"
gem "prawn-rails", "~> 1.0"
gem "prawn-table", "~> 0.2"
gem "simple_calendar", "~> 2.2"
gem "paper_trail", "~> 8.1"
gem 'validates_timeliness', '~> 4.0'
gem 'rails_db', "~> 1.6"
