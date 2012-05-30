# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Cityzoomin::Application.initialize!

# TODO: consider moving to http://www.heliohost.org/home/features/languages/ruby or https://www.alwaysdata.com/plans/shared/
# TODO: integrate google maps http://blog.yangtheman.com/2009/08/27/how-to-integrate-google-maps-in-a-rails-app/
# mailer settings
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :authentication => 'plain',
    :user_name => "#{ENV['GMAIL_ID']}",
    :password => "#{ENV['GMAIL_PWD']}",
    :enable_starttls_auto => true,
}