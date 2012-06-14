class PagesController < ApplicationController
  impressionist
  def home
    if signed_in?
      redirect_to :microposts
    else
      @title = "Home"
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
  
  def forgot_password
    
  end
  
end
