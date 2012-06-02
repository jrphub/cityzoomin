class ForgotpasswordsController < ApplicationController
  def create
    @user = User.find_by_email(params[:forgotpassword][:email])
    if @user
      @a=new_random_password
      @user.attributes={:temp_password=>@a}
      if @user.save(:validate=>false)
        if Emailer.forgot_password_email(@user)
          redirect_to fplast_path
        else
          flash.now[:error] = 'Email sending failed'
          redirect_to(:back)
        end
      else
        flash.now[:error] = 'Sorry!There is some problem. We can\'t process your email now.'
        redirect_to(:back)
      end
    else
      flash.now[:error] = 'This Email id is not registered. Please try with another or Sign up'
      redirect_to(:back)
    end
  end
  
  def edit
    @user=User.find_by_temp_password(params[:key])
  end
  
  def update
    @user=User.find(params[:user][:id])
    if update_just_this_one('password', params[:user][:password])
      sign_in @user
      redirect_to microposts_path
    else
      flash.now[:error] = 'Sorry! We couldn\'t process your request now.'
      render "edit"
    end
  end
  private
    def new_random_password
      chars = ['A'..'Z', 'a'..'z', '0'..'9'].map{|r|r.to_a}.flatten
      Array.new(6).map{chars[rand(chars.size)]}.join
    end
  
end
