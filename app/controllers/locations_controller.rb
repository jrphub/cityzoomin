class LocationsController < ApplicationController
  def show
    @allposts=Micropost.joins(:user)
    .joins('INNER JOIN locations ON microposts.location_id = locations.id')
    .select("microposts.id,content, location_id, title, category,microposts.created_at, microposts.updated_at, 
    user_id, locations.name as locname, city, state, country, username, email").where(:location_id=>params[:id])
    .paginate(page: params[:page],per_page:3)
    @locname=@allposts.first.locname
  end
end
