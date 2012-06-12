module SessionsHelper
  def sign_in(user)
     last_signin = user.signin_at
     if last_signin.nil?
       cookies[:last_signin] = user.created_at
     else
       cookies[:last_signin] = user.signin_at
     end
    user.attributes={:signin_at=>Time.now}
    user.save(:validate=>false)
    #User.update_attributes("signin_at=?", Time.now)
    cookies.permanent[:remember_token] = user.remember_token
    cookies.permanent[:userid] = user.id
    current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

#This function is widely used to check a user is logged in or not
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
    cookies.delete(:userid)
    cookies.delete(:last_signin)
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  private

    def user_from_remember_token
      remember_token = cookies[:remember_token]
      User.find_by_remember_token(remember_token) unless remember_token.nil?
    end
    
    def clear_return_to
      session.delete(:return_to)
    end
end