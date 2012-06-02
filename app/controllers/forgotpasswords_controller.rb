class ForgotpasswordsController < ApplicationController
  def create
    @user = User.find_by_email(params[:forgotpassword][:email])
    if @user
      @a=new_random_password
      @user.attributes={:temp_password=>@a}
      if @user.save(:validate=>false)
        if Emailer.forgot_password_email(@user)
          flash[:success] = "Mail sent to #{params[:forgotpassword][:email]}"
          redirect_to fplast_path
        else
          flash[:error] = 'Email sending failed'
          redirect_to(:back)
        end
      else
        flash[:error] = 'Sorry!There is some problem. We can\'t process your email now.'
        redirect_to(:back)
      end
    else
      flash[:error] = 'This Email id is not registered. Please try with another or Sign up'
      redirect_to(:back)
    end
  end
  
  def edit
    @user=User.find_by_temp_password(params[:key])
  end
  
  def update
    @user=User.find(params[:user][:id])
    if params[:user][:password] == params[:user][:password_confirmation]
      @user.attributes={:password=>params[:user][:password]}
      if @user.save(:validate=>false)
        @user.attributes={:temp_password=>"pw"}
        @user.save(:validate=>false)
        sign_in @user
        redirect_to microposts_path
      else
        flash[:error] = 'Sorry! We couldn\'t process your request now.'
        redirect_to (:back)
      end
     else
       flash[:error] = 'Password and Confirm Password must be same'
       redirect_to(:back)
     end
  end 
  private
    
    def new_random_password
      chars = ['A'..'Z', 'a'..'z', '0'..'9'].map{|r|r.to_a}.flatten
      Array.new(6).map{chars[rand(chars.size)]}.join
    end
  
end
