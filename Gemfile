source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
#gem 'unicorn'
# ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnTp8/1lalELG9HkHv3D0qfM/kIoDFiA3gHJbEv6AQSo0X9EOlEDUWW6b1T4b2YxGROWqffc9OSP5SSr5Wx1lICKH6UJdRv35676YxjGMpnIBL1Abuv+iD8NX20Xixu3PuExyg7gYaBcrXUrF0p6PJuCSIrnu6FnZoKBgv+tIpxQUUPBfHKuhzZ5pNp62j5zZE/DyoxP7//8qGn6pGd8Fxy9daixGjsluN/bNY21zOrbO0Lo+Xlt4Bk5e4FaEq70WFKYUCDeBKdjE6i5E6BkMQfSXTg+QA8GT/2344XF3lKgDWQdUUH37Dmu1UG3U56/OQzswwd+YZtYF46ns3F8W9 angelmendezz751@gmail.com

# Use Puma as the app server
#gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem "rolify"
gem "graphiql-rails"
gem 'sidekiq'
gem 'sinatra', github: 'sinatra', require: false, branch: 'master'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'
gem 'graphql'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
