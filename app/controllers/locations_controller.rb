class LocationsController < ApplicationController
  #impressionist
  def show
    if (params[:city])
      @allposts=Micropost.joins(:user)
      .joins('INNER JOIN locations ON microposts.location_id = locations.id')
      .select("microposts.id,content, location_id, title, category,microposts.created_at, microposts.updated_at, 
      user_id, name, city, state, country, username, email").where("city=?",params[:city])
      .paginate(page: params[:page],per_page:3)
      @locname=@allposts.first.city
    elsif (params[:state])
      @allposts=Micropost.joins(:user)
      .joins('INNER JOIN locations ON microposts.location_id = locations.id')
      .select("microposts.id,content, location_id, title, category,microposts.created_at, microposts.updated_at, 
      user_id,name, city, state, country, username, email").where("state=?",params[:state])
      .paginate(page: params[:page],per_page:3)
      @locname=@allposts.first.state
    elsif (params[:country])
      @allposts=Micropost.joins(:user)
      .joins('INNER JOIN locations ON microposts.location_id = locations.id')
      .select("microposts.id,content, location_id, title, category,microposts.created_at, microposts.updated_at, 
      user_id,name, city, state, country, username, email").where("country=?",params[:country])
      .paginate(page: params[:page],per_page:3)
      @locname=@allposts.first.country
    elsif(params[:id] != 'show')
      @allposts=Micropost.joins(:user)
      .joins('INNER JOIN locations ON microposts.location_id = locations.id')
      .select("microposts.id,content, location_id, title, category,microposts.created_at, microposts.updated_at, 
      user_id, name, city, state, country, username, email").where(:location_id=>params[:id])
      .paginate(page: params[:page],per_page:3)
      @locname=@allposts.first.name
    end
  end
end
