module UsersHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
  
  def gravatar_for_comment(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png"
    image_tag(gravatar_url, alt: user.username, style:"height:40px;width: 40px;")
  end
  
  def profile_pic_url(user) #This method is is used for _multipost, _one_post, locations, comments, ajax_comment
    if session[:userid]
      if (user.user_id == current_user.id)
        if session[:picurl]
          return session[:picurl]
        else
          return gravatar_for user
        end
      else
        if user.has_pic?
          url_row=Photo.where(['user_id=? AND profile_pic=?', user.user_id, 1])
          return url_row.first.url
        else
          return gravatar_for user
        end
      end
     else
       if user.has_pic?
          url_row=Photo.where(['user_id=? AND profile_pic=?', user.user_id, 1])
          return url_row.first.url
        else
          return gravatar_for user
        end
     end
  end
  
  def own_pic_url(user) #this method is used for edit profile, view profile
    if (user.id == current_user.id)
      if session[:picurl]
          return session[:picurl]
      else
        return gravatar_for user
      end
    else
      if user.has_pic?
        url_row=Photo.where(['user_id=? AND profile_pic=?', user.id, 1])
        return url_row.first.url
      else
        return gravatar_for user
      end 
    end
  end
end
