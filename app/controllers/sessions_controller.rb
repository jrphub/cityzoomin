class SessionsController < ApplicationController
  #ssl_required  :create
  #force_ssl :only=>:create
  #impressionist
  def new
    
  end
  
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or microposts_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end