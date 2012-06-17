source 'https://rubygems.org'

gem 'rails'
gem 'bootstrap-sass'
gem 'bcrypt-ruby'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem "geocoder"
gem 'gmaps4rails'
gem 'rest-client'
gem 'nokogiri'
gem 'impressionist'
gem 'thumbs_up'

group :development, :test do
  gem 'mysql2'
  gem 'annotate', '~> 2.4.1.beta' #version is mentioned to make "bundle exec annotate --position before" work
  #upon bundle update annotate gem has version 2.4.0, which is not enough to work annotate command

end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'railties'

end

gem 'jquery-rails'
# this is needed to solve a linux specific issue. On linux rails can't automatically detect the JS engine
#gem 'therubyracer'
#gem 'libv8'


group :production do
  gem 'pg'
end