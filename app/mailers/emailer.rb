class Emailer < ActionMailer::Base
  default from: "<replace on local>@gmail.com", :charset => "UTF-8"
  def confirmation_email(user)
    @user = user
    headers("X-Author" => "City Zoom-in")
    mail(:to => user.email, :subject => "Confirmation from City Zoom-in")
  end
end
