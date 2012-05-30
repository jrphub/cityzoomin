class Emailer < ActionMailer::Base
  default from: "#{ENV['GMAIL_ID']}", :charset => "UTF-8"
  # TODO: set up a background job for it in resque following http://blog.leshill.org/blog/2011/04/03/using-resque-and-resque-scheduler-on-heroku.html
  def confirmation_email(user)
    @user = user
    headers("X-Author" => "City Zoom-in")
    mail(:to => user.email, :subject => "Confirmation from City Zoom-in")
  end
end
