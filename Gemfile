source "https://rubygems.org"

ruby "2.4.1"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem "rails", "~> 5.1.4"
gem "pg"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"

gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "autoprefixer-rails"
gem "haml"
gem "administrate"
gem "administrate-field-ckeditor", "~> 0.0.8"
gem "rack-timeout"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
  gem "rspec-rails"
  gem "guard", ">= 2.2.2", require: false
  gem "guard-livereload", require: false
  gem "rack-livereload"
  gem "rb-fsevent", require: false
  gem "database_cleaner"
  gem "rspec-rails"
end

group :test do
  gem 'factory_bot_rails', '~> 4.0'
end


group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
