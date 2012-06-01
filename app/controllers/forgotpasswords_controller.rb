class ForgotpasswordsController < ApplicationController
  def create
    @user = User.find_by_email(params[:forgotpassword][:email])
    if @user
      @a=new_random_password
      if @user.update_attributes(:temp_password=>@a, :email=>params[:forgotpassword][:email])
        Emailer.forgot_password_email(@user)
        redirect_to fplast_path
      else
        flash.now[:error] = 'shit'
        redirect_to about_path
      end
    else
      flash.now[:error] = 'This Email id is not registered. Please try with another or Sign up'
      redirect_to root_path
    end
  end
  
  private
    def new_random_password
      chars = ['A'..'Z', 'a'..'z', '0'..'9'].map{|r|r.to_a}.flatten
      Array.new(6).map{chars[rand(chars.size)]}.join
    end
  
end
