source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.8'
gem 'unicorn'
gem 'dotenv-rails'

# database
gem 'sqlite3', group: :development
gem 'pg', group: :production

# asset pipeline
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
# bootstrap
gem 'bootstrap-sass'

# API
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'rack-cors', :require => 'rack/cors'

# authentifiation
gem 'devise'
gem 'doorkeeper'

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

#development helper
group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
  gem 'capistrano-rbenv', '~> 2.0', require: false

  gem 'quiet_assets'
  gem 'thin'
  gem 'better_errors'
  gem 'seed_dump'
  gem 'binding_of_caller'
end