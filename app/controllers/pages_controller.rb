class PagesController < ApplicationController
  #impressionist
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
  
  def result
    @allposts=Micropost.joins(:user)
    .joins('INNER JOIN locations ON microposts.location_id = locations.id')
    .select("microposts.id,content, location_id, title,
     category,microposts.created_at,user_id, name, city,
      state, country, username,email")
    .where("UPPER(name) LIKE :search OR UPPER(city) LIKE :search OR UPPER(state) LIKE :search OR UPPER(country) LIKE :search",
    {:search=>"%#{params[:s].upcase}%"})
    .paginate(page: params[:page],per_page:3)
  end
end
