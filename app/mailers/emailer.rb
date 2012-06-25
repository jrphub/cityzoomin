class Emailer < ActionMailer::Base
  default from: "#{ENV['GMAIL_ID']}", :charset => "UTF-8"
  # TODO: set up a background job for it in resque following http://blog.leshill.org/blog/2011/04/03/using-resque-and-resque-scheduler-on-heroku.html
  def confirmation_email(user)
    @user = user
    headers("X-Author" => "CityZoomin")
    mail(:to => user.email, :subject => "Confirmation from CityZoomin Team").deliver
  end
  
  def forgot_password_email(user)
    @user = user
    headers("X-Author" => "CityZoomin")
    mail(:to => user.email, :subject => "Reset password from CityZoomin Team").deliver
  end
  
  def contact_email(page)
    @page = page
    headers("X-Author" => "CityZoomin Admin")
    mail(:to=> "#{ENV['GMAIL_ID']}", :subject => "Contact submitted by user").deliver
  end
  
  def feedback_email(page)
    @page = page
    headers("X-Author" => "CityZoomin Admin")
    mail(:to=> "#{ENV['GMAIL_ID']}", :subject => "Feedback submitted by user").deliver
  end
end
