# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Cityzoomin::Application.initialize!

# mailer settings
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :authentication => 'plain',
    :user_name => "<replace on local>@gmail.com",
    :password => "<replace on local>",
    :enable_starttls_auto => true,
}